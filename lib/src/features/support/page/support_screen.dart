import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/constants/styles/sizes.dart';
import 'package:scooter/src/routes/routes_path.dart';
import 'package:scooter/src/features/shared_widgets/custom_alert_dialog.dart';
import 'package:scooter/src/features/shared_widgets/setting_tem.dart';
import 'package:scooter/src/features/shared_widgets/taal_new_app_bar.dart';
import '../../../constants/assets.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: const SettingAppBar(
        //   centerTitle: true,
        //   title: Strings.support,
        // ),
        appBar: const TaalNewAppBar(title: Strings.support),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: Sizes.m, bottom: Sizes.s),
                width: double.infinity,
                child: const Text(
                  Strings.discriptionSupport,
                ),
              ),
              Expanded(
                child: ListView(
                  children: <SettingItem>[
                    SettingItem(
                      title: Strings.breakdown,
                      leadingIcon: Assets.acharFarance,
                      onTap: () {
                        context.push(RoutesPath.breakdownReport);
                      },
                    ),
                    SettingItem(
                      title: Strings.accident,
                      leadingIcon: Assets.car,
                      onTap: () {
                        context.push(RoutesPath.accidentReport);
                      },
                    ),
                    SettingItem(
                        title: Strings.wrongPark,
                        leadingIcon: Assets.FrameCircle,
                        onTap: () {
                          context.push(RoutesPath.wrongParkReport);
                        }),
                    SettingItem(
                      title: Strings.callSupport,
                      leadingIcon: Assets.hedfon,
                      onTap: () {
                        CustomAlertDialog.showAvailableOnNextVersionDialog(
                          context,
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
