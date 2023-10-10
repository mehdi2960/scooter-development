import 'package:flutter/material.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/features/ride_history/widgets/card_detail_widget.dart';
import 'package:scooter/src/features/ride_history/widgets/dash_line_with_circle.dart';
import '../../../constants/styles/taal_styles.dart';

class RideHistoryCart extends StatelessWidget {
  const RideHistoryCart(
      {super.key,
      required this.origin,
      required this.destination,
      required this.price,
      required this.calendar,
      required this.time,
      this.onPress});

  final String origin;
  final String destination;
  final String price;
  final String calendar;
  final String time;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      margin:
          const EdgeInsets.symmetric(vertical: Sizes.s, horizontal: Sizes.m),
      height: height * .2,
      decoration: paymentHistoryCart,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text(Strings.destination),
              SizedBox(
                  width: width * .65, child: const DashedLineWithCircles()),
              const Text(Strings.origin),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.secondary8,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          ),
          Spaces.verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(destination),
              Text(origin),
            ],
          ),
          Spaces.verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                englishNumberToPersian('$price تومان'),
                style: titleCardHistoryTextStyle,
                textDirection: TextDirection.rtl,
              ),
              const Text(Strings.rideCost),
            ],
          ),
          Spaces.verticalSpaceTiny,
          const Divider(),
          InkWell(
            onTap: onPress,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //more detail widget
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.darkBlue,
                      size: Sizes.s,
                    ),
                    Text(
                      Strings.showDetail,
                      style: titleCardHistoryTextStyle.copyWith(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    //Time widget
                    CardDetailWidget(
                      iconAsset: Assets.clockTimeIcon,
                      title: time.getFormattedTime(),
                    ),

                    // vertical Divider widget
                    const SizedBox(
                      height: 15,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    //Calendar Widget
                    CardDetailWidget(
                      iconAsset: Assets.calendarIcon,
                      title: calendar.getFormattedDate(),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

extension DateTimeExtensions on String {
  String getFormattedDate() {
    final DateTime dateTime = DateTime.parse(this);
    return "${dateTime.year}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')}";
  }

  String getFormattedTime() {
    final DateTime dateTime = DateTime.parse(this);
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }
}
