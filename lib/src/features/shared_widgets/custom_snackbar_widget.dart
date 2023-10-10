import 'package:flutter/material.dart';

import '../../constants/styles/taal_styles.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar(
      {super.key, required this.context, required this.snackBarContent});

  final BuildContext context;
  final String snackBarContent;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: AppColors.errorLight,
                    borderRadius: BorderRadius.circular(16)),
                child: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                ),
              ),
              Spaces.horizontalSpaceSmall,
              Text(
                snackBarContent,
                style: const TextStyle(color: AppColors.errorLight),
              ),
            ],
          ),
          InkWell(
            onTap: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
            child: const Icon(Icons.close, size: 20),
          )
        ],
      ),
    );
  }
}
