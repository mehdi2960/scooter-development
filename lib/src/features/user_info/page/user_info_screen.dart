import 'package:flutter/material.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/features/shared_widgets/profile_avatar.dart';
import 'package:scooter/src/features/shared_widgets/settings_app_bar.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';
import 'package:scooter/src/features/shared_widgets/taal_filled_button.dart';
import 'package:scooter/src/features/shared_widgets/taal_new_app_bar.dart';
import 'package:scooter/src/features/shared_widgets/taal_text_field.dart';

import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  int selectedOption = 1;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const SettingAppBar(
          title: 'حساب کاربری',
          centerTitle: true,
        ),
        // appBar: const TaalNewAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spaces.verticalSpaceMedium,
              const Align(child: ProfileAvatar()),
              Spaces.verticalSpaceLarge,
              Expanded(
                child: ListView(
                  children: <Widget>[
                    const TaalTextField(
                      hintText: Strings.nameAndFamily,
                      title: Strings.nameAndFamily,
                    ),
                    const TaalTextField(
                      hintText: Strings.phoneNumber,
                      title: Strings.phoneNumber,
                    ),
                    const TaalTextField(
                      hintText: Strings.nationalCode,
                      title: Strings.nationalCode,
                    ),
                    const TaalTextField(
                      hintText: Strings.eMail,
                      title: Strings.eMail,
                    ),
                    Spaces.verticalSpaceSmall,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text('جنسیت'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: Sizes.s,
                            right: Sizes.s,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Radio(
                                      value: 1,
                                      groupValue: selectedOption,
                                      activeColor: Colors.blue,
                                      fillColor: MaterialStateProperty.all(
                                        Colors.black,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value!;
                                        });
                                      },
                                    ),
                                    const Text('مرد'),
                                  ],
                                ),
                              ),
                              const Expanded(
                                child: Spaces.horizontalSpaceMedium,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    Radio(
                                      value: 2,
                                      groupValue: selectedOption,
                                      activeColor: Colors.blue,
                                      fillColor: MaterialStateProperty.all(
                                        Colors.black,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value!;
                                        });
                                      },
                                    ),
                                    const Text('زن'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spaces.verticalSpaceMedium,
                    TaalFilledButtonNew(
                      title: 'ذخیره',
                      onPressed: () {},
                      margin: Sizes.ss,
                    ),
                    Spaces.verticalSpaceSmall,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
