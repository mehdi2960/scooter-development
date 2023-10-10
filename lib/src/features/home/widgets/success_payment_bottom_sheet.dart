import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';
import '../../../constants/assets.dart';
import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';
import '../../shared_widgets/custom_chip.dart';
import '../../shared_widgets/successfull_payment_icon.dart';

class SuccessPaymentBottomSheet extends StatefulWidget {
  const SuccessPaymentBottomSheet({super.key});

  @override
  State<SuccessPaymentBottomSheet> createState() =>
      _SuccessPaymentBottomSheetState();
}

class _SuccessPaymentBottomSheetState extends State<SuccessPaymentBottomSheet>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: Sizes.s),
          width: double.infinity,
          height: 24,
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.close,
              size: 24,
            ),
          ),
        ),
        const SuccessfullPaymentIcon(),
        Spaces.verticalSpaceSemiMedium,
        Text(
          Strings.successPayment,
          style: endRideBottomSheetTitleTextStyle.copyWith(
            color: AppColors.darkGreen,
          ),
        ),
        Spaces.verticalSpaceSmall,
        Text(
          textDirection: TextDirection.rtl,
          Strings.experienceTrip,
          style: scootrInfoBlackTextStyle,
        ),
        Spaces.verticalSpaceSmall,
        RatingBar(
          initialRating: 3,
          itemSize: Sizes.m,
          ratingWidget: RatingWidget(
            full: const SvgBox(assetName: Assets.fillStar),
            empty: const SvgBox(
              assetName: Assets.emptyStar,
            ),
            half: Container(),
          ),
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (double rating) {},
        ),
        Spaces.verticalSpaceMedium,
        Container(
          alignment: Alignment.center,
          height: Sizes.m,
          width: Sizes.xl,
          decoration: BoxDecoration(
            color: AppColors.greenWithOpacity,
            borderRadius: BorderRadius.circular(Sizes.ss),
          ),
          child: Text(
            'خوب',
            style: titleTextStyleBlue.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: DefaultTabController(
            length: 2,
            child: SizedBox(
              height: 50,
              child: TabBar(
                controller: _controller,
                tabs: const [
                  Tab(
                    text: 'نقاط ضعف',
                  ),
                  Tab(
                    text: 'نقاط قوت',
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: TabBarView(
            controller: _controller,
            children: const [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    Sizes.xxs,
                    Sizes.xs,
                    Sizes.m,
                    Sizes.xxs,
                  ),
                  child: Wrap(
                    spacing: 10,
                    children: <CustomChip>[
                      CustomChip(isSlected: true, title: Strings.usable),
                      CustomChip(isSlected: true, title: Strings.faster),
                      CustomChip(title: Strings.easyToUse),
                      CustomChip(title: Strings.enjoyable),
                      CustomChip(title: Strings.otherThings),
                    ],
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    Sizes.xxs,
                    Sizes.xs,
                    Sizes.m,
                    Sizes.xxs,
                  ),
                  child: Wrap(
                    spacing: 10,
                    children: <CustomChip>[
                      CustomChip(isSlected: true, title: Strings.usable),
                      CustomChip(isSlected: true, title: Strings.faster),
                      CustomChip(title: Strings.easyToUse),
                      CustomChip(title: Strings.enjoyable),
                      CustomChip(title: Strings.otherThings),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Spaces.verticalSpaceSmall,
        // const Directionality(
        //   textDirection: TextDirection.rtl,
        //   child: Wrap(
        //     spacing: 10,
        //     children: <CustomChip>[
        //       CustomChip(isSlected: true, title: Strings.usable),
        //       CustomChip(isSlected: true, title: Strings.faster),
        //       CustomChip(title: Strings.easyToUse),
        //       CustomChip(title: Strings.enjoyable),
        //       CustomChip(title: Strings.otherThings),
        //     ],
        //   ),
        // ),
        Spaces.verticalSpaceSmall,
        Spaces.verticalSpaceMedium,
        Container(
          margin: const EdgeInsets.symmetric(horizontal: Sizes.s),
          width: double.infinity,
          child: TextField(
            maxLines: 3, // Allows for multiple lines of input
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              hintText: 'با ارسال نظرات خود، به ارتقای تال کمک کنید',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.s),
              ),
              hintTextDirection: TextDirection.rtl,
            ),
          ),
        ),
        Spaces.verticalSpaceMedium,
        SizedBox(
          width: double.infinity,
          child: TaalFilledButtonNew(
            title: Strings.sendFeedBackTitle,
            onPressed: () {},
          ),
        ),
        Spaces.verticalSpaceSmall
      ]),
    );
  }
}
