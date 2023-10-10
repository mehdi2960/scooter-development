import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/features/settings/provider/settings_screen_provider.dart';
import 'package:scooter/src/features/shared_widgets/taal_new_app_bar.dart';

import '../../../constants/styles/taal_styles.dart';
import '../widgets/payment_method_select_modal_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsScreenProvider>(
      create: (_) => SettingsScreenProvider(context),
      child: const _SettingsScreen(),
    );
  }
}

class _SettingsScreen extends StatelessWidget {
  const _SettingsScreen();

  @override
  Widget build(BuildContext context) {
    final SettingsScreenProvider watch =
        context.watch<SettingsScreenProvider>();
    final SettingsScreenProvider read = context.read<SettingsScreenProvider>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const TaalNewAppBar(title: Strings.settings),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.s),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spaces.verticalSpaceMedium,
              Text(
                Strings.messaging,
                style: titleTextStyle,
              ),
              Spaces.verticalSpaceMedium,
              ListTile(
                leading: Text(
                  Strings.recieveEmail,
                  style: descriptionTextStyle,
                ),
                trailing: Switch(
                  value: watch.recieveEmail,
                  onChanged: read.toggleRecieveEmail,
                ),
              ),
              const Divider(),
              ListTile(
                leading: Text(
                  Strings.recieveSms,
                  style: descriptionTextStyle,
                ),
                trailing: Switch(
                  value: watch.recieveTripInfoSms,
                  onChanged: read.toggleRecieveTripInfoSms,
                ),
              ),
              const Divider(),
              ListTile(
                leading: Text(
                  Strings.recieveTransActionSms,
                  style: descriptionTextStyle,
                ),
                trailing: Switch(
                  value: watch.recieveTripTransactionSms,
                  onChanged: read.toggleRecieveTripTransactionSms,
                ),
              ),
              Spaces.verticalSpaceMedium,
              Text(
                Strings.paymentSettings,
                style: titleTextStyle,
              ),
              Spaces.verticalSpaceMedium,
              ListTile(
                  leading: Text(
                    Strings.defaultPayment,
                    style: descriptionTextStyle,
                  ),
                  trailing: TextButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          useSafeArea: true,
                          backgroundColor: Colors.white,
                          enableDrag: true,
                          isDismissible: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const PaymentMethodModalSheet();
                          },
                        );
                      },
                      icon: const Text(Strings.creaditService),
                      label: const Icon(Icons.chevron_right))),
              const Divider(),
              ListTile(
                leading: Text(
                  Strings.showTraffic,
                  style: descriptionTextStyle,
                ),
                trailing: Switch(
                  value: watch.showTraffic,
                  onChanged: read.toggleShowTraffic,
                ),
              ),
              const Divider(),
              ListTile(
                leading: Text(
                  Strings.showPublicTtansport,
                  style: descriptionTextStyle,
                ),
                trailing: Switch(
                  value: watch.showPublicTransport,
                  onChanged: read.toggleShowPublicTransport,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
