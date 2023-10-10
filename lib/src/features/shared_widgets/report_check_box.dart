import 'package:flutter/material.dart';

import '../../constants/styles/taal_styles.dart';

class ReportCheckBox extends StatelessWidget {
  const ReportCheckBox(
      {super.key,
      required this.value,
      required this.onClick,
      required this.title});

  final bool value;
  final Function(bool?) onClick;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      horizontalTitleGap: 0,
      leading: Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.all<Color>(
            AppColors.success,
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            AppColors.success,
          ),
          value: value,
          onChanged: onClick),
      title: Text(title),
    );
  }
}
