import 'package:flutter/material.dart';

import 'login_and_signup_background.dart';

class LoginSignUpPage extends StatelessWidget {
  const LoginSignUpPage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          const Positioned(
            top: 0,
            child: LoginAndSignUpBackgroundImage(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: child,
          ),
        ],
      )),
    );
  }
}
