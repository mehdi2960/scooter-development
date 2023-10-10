import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scooter/src/routes/routes_path.dart';
import 'package:scooter/src/features/shared_widgets/setting_tem.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/assets.dart';
import '../../../constants/strings.dart';

class DrawerOptionsSection extends StatelessWidget {
  const DrawerOptionsSection({
    super.key,
  });

  Future<void> _launchRulesAndConditions() async {
    const String url = 'https://mytaal.ir/#ghavanin';
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <SettingItem>[
          SettingItem(
            title: Strings.profile,
            leadingIcon: Assets.user,
            onTap: () {
              context.push(RoutesPath.profile);
            },
          ),
          SettingItem(
            title: Strings.payments,
            leadingIcon: Assets.payments,
            onTap: () {
              context.push(RoutesPath.paymentHistory);
            },
          ),
          SettingItem(
            title: Strings.rideHistory,
            leadingIcon: Assets.rideHistory,
            onTap: () {
              context.push(RoutesPath.rideHistory);
            },
          ),
          SettingItem(
            title: Strings.rulesAndConditions,
            leadingIcon: Assets.rulesAndConditions,
            onTap: _launchRulesAndConditions,
          ),
          SettingItem(
            title: Strings.howToUseScooter,
            leadingIcon: Assets.howToUseScooter,
            onTap: () {
              //Should Change
              context.push(RoutesPath.howToRide);
            },
          ),
          SettingItem(
            title: Strings.safety,
            leadingIcon: Assets.safety,
            onTap: () {
              context.push(RoutesPath.safePonis);
            },
          ),
          SettingItem(
            title: Strings.settings,
            leadingIcon: Assets.settings,
            onTap: () {
              context.push(RoutesPath.settingsScreen);
            },
          ),
          SettingItem(
            title: Strings.aboutUs,
            leadingIcon: Assets.aboutUs,
            onTap: () {
              context.push(RoutesPath.aboutUs);
            },
          ),
          SettingItem(
            title: Strings.support,
            leadingIcon: Assets.support,
            onTap: () {
              context.push(RoutesPath.support);
            },
          ),
        ],
      ),
    );
  }
}
