import 'package:flutter/material.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/features/ride_history/widgets/card_detail_widget.dart';
import '../../../constants/assets.dart';
import '../../../constants/styles/taal_styles.dart';

class PaymentHistoryCart extends StatelessWidget {
  const PaymentHistoryCart(
      {super.key,
      required this.price,
      required this.time,
      required this.date,
      this.isUnSuccess = false});

  final String price;
  final String time;
  final String date;
  final bool? isUnSuccess;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: Sizes.m, vertical: Sizes.ss),
      margin:
          const EdgeInsets.symmetric(vertical: Sizes.s, horizontal: Sizes.s),
      height: 95,
      decoration: paymentHistoryCart,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '$price تومان',
                style: !isUnSuccess!
                    ? feeTextStyle
                    : feeTextStyle.copyWith(color: AppColors.error),
                textDirection: TextDirection.rtl,
              ),
              const CardDetailWidget(
                  title: Strings.costTitle, iconAsset: Assets.money),
            ],
          ),
          const DottedDivider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CardDetailWidget(title: time, iconAsset: Assets.clockTimeIcon),
              CardDetailWidget(title: date, iconAsset: Assets.calendarIcon)
            ],
          )
        ],
      ),
    );
  }
}

class DottedDivider extends StatelessWidget {
  const DottedDivider({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double boxWidth = constraints.constrainWidth();
        const double dashWidth = 10.0;
        final double dashHeight = height;
        final int dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
