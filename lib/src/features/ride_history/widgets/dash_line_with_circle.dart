import 'package:flutter/material.dart';
import 'package:scooter/src/constants/styles/colors.dart';

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
    const Color dashColor = AppColors.green;

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
