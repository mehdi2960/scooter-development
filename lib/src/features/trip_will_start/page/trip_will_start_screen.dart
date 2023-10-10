import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';
import 'package:scooter/src/features/shared_widgets/taal_new_app_bar.dart';
import 'package:scooter/src/features/trip_will_start/provider/trip_will_start_provider.dart';
import 'package:scooter/src/features/trip_will_start/widgets/scooter_trip_item.dart';
import '../../../constants/assets.dart';
import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';

class TripWillStartScreen extends StatelessWidget {
  const TripWillStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TripWillStartProvider>(
      create: (_) => TripWillStartProvider(context),
      child: const _TripWillStartScreen(),
    );
  }
}

class _TripWillStartScreen extends StatelessWidget {
  const _TripWillStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TripWillStartProvider watch = context.watch<TripWillStartProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TaalNewAppBar(
        title: Strings.startRide,
        forwardOnPress: () => context.pop(),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: Sizes.s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spaces.verticalSpaceLarge,
                    Spaces.verticalSpaceLarge,
                    // Spaces.verticalSpaceLarge,
                    Text(
                      englishNumberToPersian('اسکوتر پرو M214')
                      // 'اسکوتر پرو M214',
                      ,
                      style: scooterInfoTextStyle,
                    ),
                    Spaces.verticalSpaceSmall,
                    Text(
                      'اسکوتر پرو یکی از بهترین و مقاوم‌ترین اسکوتر‌ها است. ',
                      textAlign: TextAlign.center,
                      style: descriptionTextStyle,
                    ),
                  ],
                ),
              ),
              Spaces.verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        englishNumberToPersian('64%'),
                        style: scooterInfoBigTextStyle,
                      ),
                      Spaces.verticalSpaceTiny,
                      const Text('باتری'),
                      Spaces.verticalSpaceMedium,
                      Text(
                        englishNumberToPersian('20Kmh'),
                        style: scooterInfoBigTextStyle,
                      ),
                      Spaces.verticalSpaceTiny,
                      const Text('حداکثر سرعت'),
                      Spaces.verticalSpaceMedium,
                      Text(
                        englishNumberToPersian('12Kg'),
                        style: scooterInfoBigTextStyle,
                      ),
                      Spaces.verticalSpaceTiny,
                      const Text('وزن'),
                    ],
                  ),
                  Image.asset(
                    Assets.TripWillStartScooter,
                    width: MediaQuery.of(context).size.width * .55,
                    height: MediaQuery.of(context).size.width * .8,
                  ),
                ],
              ),
              Spaces.verticalSpaceMedium,
              const ScooterTripDataItem(
                icon: Assets.coins,
                title: 'اجاره اسکوتر:',
                subTitle: 'دقیقه‌ای ۱۰۰۰ تومان',
              ),
              Spaces.verticalSpaceSmall,
              const ScooterTripDataItem(
                icon: Assets.batteryPrecent,
                title: 'شارژ اسکوتر:',
                subTitle: '۵۴٪',
              ),
              Spaces.verticalSpaceSmall,
              const ScooterTripDataItem(
                icon: Assets.time,
                title: 'زمان قابل استفاده:',
                subTitle: '۵ ساعت',
              ),
              Spaces.verticalSpaceSmall,
              const ScooterTripDataItem(
                icon: Assets.range,
                title: 'مسافت قابل استفاده:',
                subTitle: '۲۵ کیلومتر',
              ),
              Spaces.verticalSpaceSemiLarge,
              TaalFilledButtonNew(
                  title: Strings.startRideText,
                  width: double.infinity,
                  onPressed: () => watch.startRideButton()),
              Spaces.verticalSpaceSmall
            ],
          ),
        ),
      ),
    );
  }
}
