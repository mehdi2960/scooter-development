import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/constants/styles/colors.dart';
import 'package:scooter/src/constants/styles/sizes.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';
import 'package:scooter/src/features/shared_widgets/settings_app_bar.dart';
import 'package:scooter/src/features/shared_widgets/taal_filled_button.dart';
import 'package:scooter/src/features/trip_screen/widget/item_trip.dart';

class EndTripScreen extends StatefulWidget {
  const EndTripScreen({super.key});

  @override
  State<EndTripScreen> createState() => _EndTripScreenState();
}

class _EndTripScreenState extends State<EndTripScreen> {
  bool visibale = false;
  int selectedOption = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingAppBar(
        title: 'پایان سفر',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.s),
          child: Column(
            children: [
              // const SvgBox(assetName: Assets.map),
              Image.asset('assets/images/Rectangle.png'),
              Spaces.verticalSpaceSmall,
              const Text(Strings.titleTripMap),
              Spaces.verticalSpaceSmall,
              Container(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: .5,
                    color: AppColors.grayWithOpacity,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  children: [
                    ItemTrip(
                      subTitle: Strings.itemSubTitle1,
                      title: Strings.itemTitle1,
                      icon: Assets.Frame,
                    ),
                    ItemTrip(
                      title: Strings.itemTitle2,
                      subTitle: Strings.itemSubTitle2,
                      icon: Assets.clockTime,
                    ),
                    ItemTrip(
                      title: Strings.itemTitle3,
                      subTitle: Strings.itemSubTitle3,
                      icon: Assets.timersvgtitlesvg,
                    ),
                  ],
                ),
              ),
              Spaces.verticalSpaceSmall,
              Container(
                padding: const EdgeInsets.all(Sizes.s),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: .5,
                    color: AppColors.grayWithOpacity,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'نحوه پرداخت',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.dark,
                      ),
                    ),
                    Spaces.verticalSpaceSmall,
                    Row(
                      children: [
                        const Text('قبض موبایل'),
                        Radio(
                          value: 1,
                          groupValue: selectedOption,
                          activeColor: Colors.blue,
                          // Change the active radio button color here
                          fillColor: MaterialStateProperty.all(Colors
                              .blue), // Change the fill color when selected
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                        const Expanded(
                          child: Spaces.horizontalSpaceMedium,
                        ),
                        const Text('پرداخت آنلاین'),
                        Radio(
                          value: 2,
                          groupValue: selectedOption,
                          activeColor: Colors.blue,
                          fillColor: MaterialStateProperty.all(
                            Colors.blue,
                          ),
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spaces.verticalSpaceSmall,
              Container(
                // height: 100,
                padding: const EdgeInsets.all(Sizes.xs),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: .5,
                    color: AppColors.grayWithOpacity,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              visibale = !visibale;
                            });
                          },
                          icon: const Icon(Icons.add),
                          label: Text(
                            Strings.afzodanCodeTakhfif,
                            style: scooterInfoTextStyle,
                          ),
                        ),
                        Text(
                          Strings.codeTakhfif,
                          style: scootrInfoBlackTextStyle,
                        ),
                      ],
                    ),
                    Visibility(
                      visible: visibale,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          color: AppColors.dark10,
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                height: 35,
                                width: 74,
                                child: const Text(
                                  'ثبت',
                                  style: TextStyle(
                                      color: AppColors.primaryWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: 230,
                                // color: Colors.amber,
                                child: const TextField(
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Spaces.verticalSpaceSmall,
              Container(
                padding: const EdgeInsets.all(Sizes.xs),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: .5,
                    color: AppColors.grayWithOpacity,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  children: [
                    ItemHazineh(
                      title: Strings.hazinehSavari,
                      price: Strings.price,
                    ),
                    Spaces.verticalSpaceMedium,
                    ItemHazineh(
                      title: Strings.mablagGabelPardakht,
                      price: Strings.price,
                    ),
                  ],
                ),
              ),
              Spaces.verticalSpaceMedium,
              TaalFilledButton(text: 'پرداخت', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
