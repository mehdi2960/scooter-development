import 'package:flutter/material.dart';

class EclipseWidget extends StatelessWidget {
  const EclipseWidget({
    super.key,
    required this.isRightCircular,
    required this.borderColor,
    required this.width,
    this.child,
  });

  final bool isRightCircular;
  final Color borderColor;
  final double width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: 100,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: isRightCircular
                ? const BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0),
                  ),
          ),
          color: Colors.transparent,
        ),
        child: child);
  }
}
