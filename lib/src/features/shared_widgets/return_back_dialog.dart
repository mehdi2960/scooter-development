import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../constants/strings.dart';
import '../../constants/styles/taal_styles.dart';

class ReturnBackDialog extends StatelessWidget {
  const ReturnBackDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      actions: <Widget>[
        CupertinoButton(
          onPressed: () {
            context.pop();
          },
          child: const Text(
            Strings.returnBack,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
              fontFamily: 'iranSans',
            ),
          ),
        ),
      ],
      content: const Text(
        Strings.availablOnNextVersion,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor,
          fontFamily: 'iranSans',
        ),
      ),
    );
  }
}
