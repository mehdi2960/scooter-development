import 'package:flutter/material.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/apis/calculate_cost_api.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/styles/taal_styles.dart';
import '../provider/home_screen_provider.dart';

class PayDebtWidget extends StatelessWidget {
  const PayDebtWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenProvider watch = context.watch<HomeScreenProvider>();

    //* launch payment Gateway
    Future<void> launchPaymentGateWay(String url) async {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Container(
      margin: const EdgeInsets.only(top: Sizes.m),
      padding: const EdgeInsets.fromLTRB(12, 8, 20, 8),
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.17),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: <Widget>[
          Text(
            'بدهی شما: ',
            style: payDebtTextStyle.copyWith(color: Colors.black),
          ),
          Text(
            ' - ${englishNumberToPersian('${watch.debtAmount}')}',
            style: payDebtTextStyle.copyWith(color: AppColors.errorLight),
          ),
          Text(
            ' تومان',
            style: payDebtTextStyle.copyWith(color: Colors.black),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: OutlinedButton(
              onPressed: () async {
                final String url = await CalculateTripCostAPIController()
                    .payEndRide(
                        amount: watch.debtAmount.toString(),
                        userId: '383c647d-6e8b-47d7-840c-21c585c94604',
                        errorHandler: (dynamic error) => error = true);

                launchPaymentGateWay(url);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.error),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
              ),
              child: Text(
                'پرداخت',
                style: payDebtTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
