import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/constants/styles/sizes.dart';
import 'package:scooter/src/constants/styles/spaces.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';
import 'package:scooter/src/features/detaill_screen/widgets/item_widget.dart';
import 'package:scooter/src/features/shared_widgets/settings_app_bar.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';
import 'package:scooter/src/features/shared_widgets/taal_filled_button.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const SettingAppBar(
        centerTitle: true,
        title: 'جزیئیات سواری',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: Sizes.s, right: Sizes.s),
          child: Column(
            children: [
              Center(
                child: Image.asset(Assets.MapRectangle),
              ),
              Spaces.verticalSpaceSmall,
              Text(
                Strings.titleTripMap,
                style: header2TextStyle,
              ),
              Spaces.verticalSpaceSmall,
              //! Canvas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text(Strings.destination),
                  SizedBox(
                    width: size.width * .65,
                    child: const DashedLineWithCircles(),
                  ),
                  const Text(Strings.origin),
                ],
              ),
              Spaces.verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.textMelat,
                    style: detailTitleTextStyle,
                  ),
                  Text(
                    Strings.textParkvay,
                    style: detailTitleTextStyle,
                  ),
                ],
              ),
              Spaces.verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    Assets.detailScooter,
                    width: 122,
                    height: 130,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(Strings.codeSavariText, style: detailCodeTextStyle),
                      Spaces.verticalSpaceTiny,
                      const Text(Strings.codeSavari),
                      Spaces.verticalSpaceTiny,
                      Text(Strings.codeScotertext, style: detailCodeTextStyle),
                      Spaces.verticalSpaceTiny,
                      Text(englishNumberToPersian(Strings.codeScoter)),
                    ],
                  )
                ],
              ),
              Spaces.verticalSpaceMedium,
              Column(
                children: [
                  const DetailItemWidget(
                    title: Strings.hazineSavari,
                    subTitle: Strings.hazineSavari1,
                    icon: Assets.coins,
                  ),
                  Spaces.verticalSpaceSmall,
                  const DetailItemWidget(
                    title: Strings.ravashPardakht,
                    subTitle: Strings.ravashPardakht1,
                    icon: Assets.cashBanknote,
                  ),
                  Spaces.verticalSpaceSmall,
                  DetailItemWidget(
                    title: Strings.modatZaman,
                    subTitle: englishNumberToPersian(Strings.modatZaman1),
                    icon: Assets.clock,
                  ),
                  Spaces.verticalSpaceSmall,
                  DetailItemWidget(
                      title: Strings.discount,
                      subTitle: Strings.discount1,
                      icon: englishNumberToPersian(Assets.Discount)),
                  Spaces.verticalSpaceSmall,
                  DetailItemWidget(
                    title: Strings.PardakhtShodeh,
                    subTitle: englishNumberToPersian(
                      Strings.PardakhtShodeh1,
                    ),
                    icon: Assets.cashBanknote,
                  ),
                ],
              ),
              Spaces.verticalSpaceMedium,
              TaalFilledButton(text: 'دریافت رسید', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  DashedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
  });
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    final Path dashPath = Path();
    final double startY = size.height / 2.0;
    final double endX = size.width;
    for (double x = 0; x < endX; x += dashWidth + dashSpace) {
      dashPath.moveTo(x, startY);
      dashPath.lineTo(x + dashWidth, startY);
    }
    canvas.drawPath(dashPath, paint);
    final double circleRadius = size.height / 2.0;
    final Offset leftCircleCenter = Offset(0, startY);
    final Offset rightCircleCenter = Offset(endX, startY);
    final Paint circlePaint = Paint()..color = color;
    canvas.drawCircle(leftCircleCenter, circleRadius * 5, circlePaint);
    canvas.drawCircle(rightCircleCenter, circleRadius * 5, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DashedLineWithCircles extends StatelessWidget {
  const DashedLineWithCircles({super.key});
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const double lineHeight = 2.0;
    const double dashWidth = 10.0;
    const double dashSpace = 5.0;
    const Color dashColor = AppColors.primary2;
    return SizedBox(
      height: lineHeight,
      width: screenWidth,
      child: CustomPaint(
        painter: DashedLinePainter(
          color: dashColor,
          strokeWidth: lineHeight,
          dashWidth: dashWidth,
          dashSpace: dashSpace,
        ),
      ),
    );
  }
}
