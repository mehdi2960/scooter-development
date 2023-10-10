import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/battery_widget.dart';
import 'package:scooter/src/features/shared_widgets/cutom_text_bottom_sheet.dart';
import 'package:scooter/src/features/shared_widgets/scooter_widget.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';
import '../../constants/assets.dart';
import '../../constants/strings.dart';
import '../../constants/styles/taal_styles.dart';

class ReserveScooterBottomSheet extends StatelessWidget {
  const ReserveScooterBottomSheet(
      {super.key,
      required this.audioIconOnPressed,
      required this.reserveOnPressed,
      required this.scanBarCodeOnPressed,
      required this.batteryPersentage});

  final VoidCallback audioIconOnPressed;
  final VoidCallback reserveOnPressed;
  final VoidCallback scanBarCodeOnPressed;
  final String batteryPersentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(Sizes.m),
              topLeft: Radius.circular(Sizes.m))),
      height: MediaQuery.of(context).size.height * .35,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //scooter widget
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin:
                          const EdgeInsets.only(left: Sizes.m, top: Sizes.s),
                      decoration: BoxDecoration(
                          color: AppColors.decorationNumber,
                          borderRadius: BorderRadius.circular(Sizes.ss)),
                      child: IconButton(
                          onPressed: audioIconOnPressed,
                          icon: const SvgBox(assetName: Assets.audioIcon))),
                  const ScooterWidget(scooterNumber: '#182'),
                ],
              ),
              // custom text with battery icon
              Padding(
                padding: const EdgeInsets.only(right: Sizes.s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    BatteryWidget(
                      batteryPersentage: batteryPersentage,
                    ),

                    // Image.asset(Assets.batteryImage),
                    Spaces.verticalSpaceSmall,
                    const CustomBottomSheetText(
                        title: Strings.priceRideTitle,
                        subTitle: 'دقیقه‌ای 1000 تومان'),
                    Spaces.verticalSpaceTiny,
                    const CustomBottomSheetText(
                        title: Strings.scooterTimerUsageTitle,
                        subTitle: 'تقریبا 3 ساعت'),
                    Spaces.verticalSpaceTiny,
                    const CustomBottomSheetText(
                        title: Strings.scooterdistanceUsageTitle,
                        subTitle: 'تقریبا 7 کیلو‌متر'),
                  ],
                ),
              ),
            ],
          ),
          Spaces.verticalSpaceSmall,
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: TaalFilledButtonNew(
                  title: Strings.reserve,
                  isPrimary: false,
                  onPressed: reserveOnPressed,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TaalFilledButtonNew(
                    title: Strings.scanBarCode,
                    icon: Assets.scanCodeIcon,
                    onPressed: scanBarCodeOnPressed,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
