import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:scooter/src/constants/strings.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';
import 'package:scooter/src/features/shared_widgets/taal_custom_button.dart';
import 'package:scooter/src/routes/routes_path.dart';

class EmptyRideHistory extends StatelessWidget {
  const EmptyRideHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Hellow'),
          Spaces.verticalSpaceMedium,
          const Text(
            Strings.noRideTitle,
            textDirection: TextDirection.rtl,
          ),
          Spaces.verticalSpaceMedium,
          TaalFilledButtonNew(
            title: Strings.noRideButtonTitle,
            onPressed: () => context.pushReplacement(RoutesPath.home),
          )
        ],
      ),
    );
  }
}
