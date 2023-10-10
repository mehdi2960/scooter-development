import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';
import 'package:scooter/src/routes/routes_path.dart';
import 'package:scooter/src/services/storage.dart';

class SignOutBottomSheet extends StatelessWidget {
  const SignOutBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          children: <Widget>[
            Spaces.verticalSpaceMedium,
            Text(
              Strings.logout,
              style: titleTextStyle,
              textDirection: TextDirection.rtl,
            ),
            Spaces.verticalSpaceSmall,
            Text(
              Strings.confirmLogOut,
              style: scootrInfoBlackTextStyle,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Spaces.verticalSpaceMedium,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // custom text with battery icon
            Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: TaalFilledButtonNew(
                      title: Strings.decline,
                      isPrimary: false,
                      onPressed: () => Navigator.pop(context)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: TaalFilledButtonNew(
                    title: Strings.exit,
                    onPressed: () {
                      Storage.instance.logout();
                      context.pushReplacement(RoutesPath.login);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        Spaces.verticalSpaceMedium,
      ],
    );
  }
}
