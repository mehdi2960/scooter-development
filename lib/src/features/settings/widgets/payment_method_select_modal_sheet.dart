import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/taal_filled_button.dart';

import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';

class PaymentMethodModalSheet extends StatelessWidget {
  const PaymentMethodModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, right: 10),
        child: Wrap(children: <Widget>[
          SizedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Spaces.verticalSpaceMedium,
                Text(
                  Strings.defaultPayment,
                  style: titleTextStyle,
                ),
                Spaces.verticalSpaceSmall,
                ListTile(
                  leading: Checkbox(
                    activeColor: AppColors.success,
                    shape: const CircleBorder(),
                    value: true,
                    onChanged: (bool? value) {},
                  ),
                  title: const Text(Strings.creaditServiceOnlinePay),
                ),
                ListTile(
                  leading: Checkbox(
                    activeColor: AppColors.success,
                    shape: const CircleBorder(),
                    value: true,
                    onChanged: (bool? value) {},
                  ),
                  title: const Text(Strings.mobileBill),
                ),
                TaalFilledButton(
                    text: Strings.submit,
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]))
        ]),
      ),
    );
  }
}
