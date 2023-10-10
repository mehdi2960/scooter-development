import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/features/sign_up/provider/sign_up_screen_provider.dart';
import 'package:scooter/src/features/sign_up/widgets/signup_cart.dart';
import '../../shared_widgets/login_signup_page.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpScreenProvider>(
      create: (_) => SignUpScreenProvider(context),
      child: const _SignUpScreen(),
    );
  }
}

class _SignUpScreen extends StatelessWidget {
  const _SignUpScreen();

  @override
  Widget build(BuildContext context) {
    return const LoginSignUpPage(
      child: SignUpCart(),
    );
  }
}
