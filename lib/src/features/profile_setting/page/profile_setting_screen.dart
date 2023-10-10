import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/features/profile_setting/widgets/sign_out_bottom_sheet.dart';
import 'package:scooter/src/features/shared_widgets/profile_avatar.dart';
import 'package:scooter/src/features/shared_widgets/settings_app_bar.dart';
import 'package:scooter/src/features/shared_widgets/taal_new_app_bar.dart';
import 'package:scooter/src/routes/routes_path.dart';
import 'package:scooter/src/services/storage.dart';
import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';
import '../../shared_widgets/setting_tem.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const SettingAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              Spaces.verticalSpaceLarge,
              const ProfileAvatar(),
              Spaces.verticalSpaceMedium,
              Text(Storage.instance.phoneNumber ?? '09111111111'),
              Text(
                Storage.instance.profileName ?? 'ادریس فتخی',
                style: titleTextStyle,
              ),
              Spaces.verticalSpaceMedium,
              Expanded(
                child: ListView(
                  children: <SettingItem>[
                    SettingItem(
                      title: Strings.messages,
                      leadingIcon: Assets.accident,
                      onTap: () {
                        context.push(RoutesPath.messages);
                      },
                    ),
                    SettingItem(
                      title: Strings.userInformation,
                      leadingIcon: Assets.profile,
                      onTap: () {
                        context.push(RoutesPath.userInfo);
                      },
                    ),
                    SettingItem(
                      title: Strings.logout,
                      leadingIcon: Assets.aboutUs,
                      onTap: () {
                        showModalBottomSheet(
                          useSafeArea: true,
                          backgroundColor: Colors.white,
                          enableDrag: true,
                          isDismissible: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const SignOutBottomSheet();
                          },
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
