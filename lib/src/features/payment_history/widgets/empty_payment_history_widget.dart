import 'package:flutter/cupertino.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';

class EmptyPaymentHistory extends StatelessWidget {
  const EmptyPaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Hellow'),
          Spaces.verticalSpaceMedium,
          Text(
            'پرداختی وجود ندارد!',
            textDirection: TextDirection.rtl,
          ),
          Spaces.verticalSpaceMedium,
        ],
      ),
    );
  }
}
