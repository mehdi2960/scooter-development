import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/features/home/provider/profile_info_provider.dart';
import 'package:scooter/src/features/home/widgets/pay_debt_widget.dart';
import 'package:scooter/src/features/home/widgets/success_payment_bottom_sheet.dart';
import 'package:scooter/src/features/shared_widgets/custom_bottom_sheet.dart';
import 'package:scooter/src/features/shared_widgets/finish_end_ride_bottom_sheet.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';
import '/src/constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';
import '../../shared_providers/vehicle_provider.dart';
import '../../shared_widgets/taal_app_bar.dart';
import '../provider/home_screen_provider.dart';
import '../widgets/custom_map.dart';
import '../widgets/home_screen_action_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PrfileInfoProvider>(
            create: (_) => PrfileInfoProvider()),
        ChangeNotifierProvider<HomeScreenProvider>(
            create: (_) => HomeScreenProvider(context),
            child: const _HomeScreen()),
      ],
      child: ChangeNotifierProvider<HomeScreenProvider>(
          create: (_) => HomeScreenProvider(context),
          child: const _HomeScreen()),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    final HomeScreenProvider watch = context.watch<HomeScreenProvider>();
    final HomeScreenProvider read = context.read<HomeScreenProvider>();
    final VehicleProvider vehicleProvider = context.watch<VehicleProvider>();
    context.watch<PrfileInfoProvider>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            if (watch.debtAmount != null)
              const Positioned(top: 92, right: 20, child: PayDebtWidget()),
            CustomMap(
              mapController: watch.mapController,
              scooters: vehicleProvider.vehicles,
              onMapDoubleTap: watch.onMapDoubleTap,
              onMapScaleStart: watch.onMapScaleStart,
              onMapScaleUpdate: watch.onMapScaleUpdate,
              onPointerSignal: watch.onPointerSignal,
              currentUserLocation: watch.currentUserLocation,
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spaces.verticalSpaceMedium,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: TaalAppBar(),
                  ),
                  const Spacer(),
                  const HomeScreenActionButtons(),
                  Spaces.verticalSpaceSmall,
                  if (!watch.isRiding)
                    TaalFilledButtonNew(
                      width: double.infinity,
                      title: Strings.inputCode,
                      // onPressed: read.goToScanCodeScreen,
                      onPressed: () =>
                          CustomBottomSheet.showCustomBottomSheetWidgets(
                              context: context,
                              widget: SuccessPaymentBottomSheet()),
                      icon: Assets.scanCodeIcon,
                    )
                  else
                    TaalFilledButtonNew(
                      width: double.infinity,
                      onPressed: () {
                        CustomBottomSheet.showCustomBottomSheetWidgets(
                            context: context,
                            widget: FinishEndRideBottomSheet(
                              continueOnPressed: () => context.pop(),
                              finishEndRideOnPressed: () => watch.stopRide(),
                            ));
                      },
                      title: Strings.stopScooter,
                    ),
                  Spaces.verticalSpaceSmall
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
