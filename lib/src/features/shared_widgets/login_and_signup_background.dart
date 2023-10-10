import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';
import '../../constants/assets.dart';

class LoginAndSignUpBackgroundImage extends StatelessWidget {
  const LoginAndSignUpBackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Image.asset(
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          Assets.loginSignUpBackgroundImage,
        ),
        const SvgBox(
          assetName: Assets.taalLogo,
          color: Colors.white,
        )
      ],
    );
  }
}
