import 'package:another_stepper/another_stepper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';
import 'package:scooter/src/features/shared_widgets/settings_app_bar.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';

class EndRideScreen extends StatefulWidget {
  const EndRideScreen({super.key});

  @override
  State<EndRideScreen> createState() => _EndRideScreenState();
}

class _EndRideScreenState extends State<EndRideScreen> {
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
  }

  List<StepperData> stepperData = [
    StepperData(
      title: StepperText(
        'اسکوتر را روی جک قرار دهید',
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      iconWidget: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: .5,
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: const Icon(
          Icons.check,
          color: Colors.grey,
          size: 16,
        ),
      ),
    ),
    StepperData(
      title: StepperText(
        'قفل اسکوتر را بین فرمان و چرخ ببندید.',
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      iconWidget: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: .5,
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: const Icon(
          Icons.check,
          color: Colors.grey,
          size: 16,
        ),
      ),
    ),
    StepperData(
      title: StepperText(
        'تصویر اسکوتر را بارگذاری کنید.',
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      iconWidget: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: .5,
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: const Icon(
          Icons.check,
          color: Colors.grey,
          size: 16,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingAppBar(
        title: Strings.finishEndRide,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Sizes.s),
              margin: const EdgeInsets.fromLTRB(14, 20, 14, 14),
              decoration: BoxDecoration(
                color: const Color(0xffFCFCFC),
                borderRadius: BorderRadius.circular(Sizes.s),
                border: Border.all(width: 0.5, color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    Strings.titleEndRide,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          Strings.contentEndRide,
                          style: TextStyle(
                            color: AppColors.totalDeptColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        SvgPicture.asset(Assets.infoCircle),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(Assets.video),
                      SizedBox(
                        width: double.infinity,
                        child: SvgPicture.asset(Assets.videoIcon),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Sizes.s),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    Strings.marahel,
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spaces.verticalSpaceSmall,
                  Text(Strings.contentMarahel)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 0, 12, 0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: AnotherStepper(
                  barThickness: 1,
                  verticalGap: 20,
                  stepperList: stepperData,
                  stepperDirection: Axis.vertical,
                  iconWidth: 24,
                  iconHeight: 24,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: DottedBorder(
                  color: AppColors.primary2,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(Sizes.s),
                  padding: const EdgeInsets.all(6),
                  dashPattern: [6, 6],
                  child: const Center(
                    child: Column(
                      children: [
                        SvgBox(assetName: Assets.cameraIcon),
                        Spaces.verticalSpaceSmall,
                        Text(
                          Strings.titleCamera,
                          style: TextStyle(color: AppColors.primary2),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Spaces.verticalSpaceMedium,
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: TaalFilledButtonNew(
                    isPrimary: false,
                    title: 'ادامه سواری',
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: TaalFilledButtonNew(
                    title: 'پایان سواری',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Spaces.verticalSpaceSmall
          ],
        ),
      ),
    );
  }
}
