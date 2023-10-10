import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/taal_filled_button.dart';

import '../../constants/strings.dart';
import '../../constants/styles/taal_styles.dart';

mixin CustomAlertDialog {
  static Future<void> showMessageDialog(
      {required BuildContext context,
      required String title,
      required String description,
      required Color textColor,
      required String textButton,
      required void Function()? onPressed}) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                decoration: paymentHistoryCart,
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(
                            color: AppColors.secondary8,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8, right: 8),
                          child: Row(
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
                              Spaces.horizontalSpaceTiny,
                              Text(
                                title,
                                style:
                                    dialogTextStyle.copyWith(color: textColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // error description & button
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 8),
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(description),
                          ),
                          Spaces.verticalSpaceSmall,
                          SizedBox(
                            width: 300.0,
                            child: TaalFilledButton(
                              hasPadding: false,
                              onPressed: onPressed,
                              text: textButton,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static Future<void> showAvailableOnNextVersionDialog(
    BuildContext context,
  ) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  Strings.availablOnNextVersion,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: 'iranSans',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(Strings.confirm),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
