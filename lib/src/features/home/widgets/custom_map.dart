import 'dart:math';
import 'package:arna_logger/arna_logger.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/config/environments.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';
import 'package:scooter/src/features/home/provider/home_screen_provider.dart';
import 'package:scooter/src/features/shared_widgets/custom_bottom_sheet.dart';
import 'package:scooter/src/features/shared_widgets/reserve_scooter_bottom_sheet.dart';
import 'package:scooter/src/models/scooter.dart';
import 'package:scooter/src/routes/routes_path.dart';
import 'package:scooter/src/services/storage.dart';
import '/src/constants/assets.dart';
import '../../shared_widgets/svg_box.dart';

class CustomMap extends StatelessWidget {
  const CustomMap({
    super.key,
    required this.mapController,
    required this.onMapDoubleTap,
    required this.onMapScaleStart,
    required this.onMapScaleUpdate,
    required this.onPointerSignal,
    required this.scooters,
    this.currentUserLocation,
  });

  final MapController mapController;
  final List<Scooter> scooters;
  final Function(MapTransformer, Offset) onMapDoubleTap;
  final Function(ScaleStartDetails) onMapScaleStart;
  final Function(ScaleUpdateDetails, MapTransformer) onMapScaleUpdate;
  final Function(PointerSignalEvent, MapTransformer) onPointerSignal;
  final LatLng? currentUserLocation;

  Widget _buildMarkerWidget(
    Scooter scooter,
    MapTransformer transformer,
    BuildContext context,
  ) {
    final LatLng coordinate = LatLng(
      scooter.location[0],
      scooter.location[1],
    );
    final Offset pos = transformer.toOffset(coordinate);
    return Positioned(
      left: pos.dx - 24,
      top: pos.dy - 24,
      width: 48,
      height: 48,
      child: GestureDetector(
        onTap: () {
          // save scooter id
          Storage.instance.setScooterId(scooter.id!);
          arnaLogger(data: '${scooter.id}', title: 'scooter_id is :');

          // display reserve_bottom_sheet
          CustomBottomSheet.showCustomBottomSheetWidgets(
              context: context,
              widget: ReserveScooterBottomSheet(
                audioIconOnPressed: () {},
                reserveOnPressed: () => context.push(RoutesPath.tripWillStart),
                batteryPersentage: scooter.battery.toString(),
                scanBarCodeOnPressed: () =>
                    context.read<HomeScreenProvider>().goToScanCodeScreen(),
              )
              //  ScooterSelectModalSheet(
              //   batteryLevel: scooter.battery!,
              // )
              );
        },
        child: const SvgBox(
          assetName: Assets.taalMarker,
          width: 48,
          height: 48,
        ),
      ),
    );
  }

  Widget _buildCurrentLocationWidget(Offset pos) {
    return Positioned(
      left: pos.dx - 24,
      top: pos.dy - 24,
      // width: 48,
      // height: 48,
      child: Row(
        children: <Widget>[
          const SvgBox(
            assetName: Assets.pin,
            width: 48,
            height: 48,
          ),
          Spaces.horizontalSpaceTiny,
          Container(
            padding: const EdgeInsets.all(8),
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: Text(
                Strings.youAreHere,
                style: youAreHereTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MapLayout(
      controller: mapController,
      builder: (BuildContext context, MapTransformer transformer) {
        Iterable<Widget> markerWidgets = <Widget>[];
        final List<Scooter> markerPositions = <Scooter>[];
        for (final Scooter scooter in scooters) {
          if (scooter != null) {
            if (scooter.location != null &&
                scooter.location[0] != null &&
                scooter.location[1] != null) {
              markerPositions.add(scooter);
            }
          }
        }

        markerWidgets = markerPositions.map(
          (Scooter scooter) =>
              _buildMarkerWidget(scooter, transformer, context),
        );

        Widget? currentLocationPin;
        if (currentUserLocation != null) {
          final Offset currentLocationOffset = transformer.toOffset(
            currentUserLocation!,
          );
          currentLocationPin = _buildCurrentLocationWidget(
            currentLocationOffset,
          );
        }

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onDoubleTapDown: (TapDownDetails details) => onMapDoubleTap(
            transformer,
            details.localPosition,
          ),
          onScaleStart: onMapScaleStart,
          onScaleUpdate: (ScaleUpdateDetails details) => onMapScaleUpdate(
            details,
            transformer,
          ),
          child: Listener(
            behavior: HitTestBehavior.opaque,
            onPointerSignal: (PointerSignalEvent event) {
              onPointerSignal(event, transformer);
            },
            child: Stack(
              children: <Widget>[
                TileLayer(
                  builder: (BuildContext context, int x, int y, int z) {
                    final int tilesInZoom = pow(2.0, z).floor();

                    while (x < 0) {
                      x += tilesInZoom;
                    }
                    while (y < 0) {
                      y += tilesInZoom;
                    }
                    x %= tilesInZoom;
                    y %= tilesInZoom;

                    return CachedNetworkImage(
                      imageUrl:
                          'https://api.mapbox.com/styles/v1/mapbox/light-v11/tiles/$z/$x/$y?access_token=${Environments.mapBoxToken}',
                      fit: BoxFit.cover,
                    );
                  },
                ),
                ...markerWidgets,
                if (currentLocationPin != null) currentLocationPin
              ],
            ),
          ),
        );
      },
    );
  }
}
