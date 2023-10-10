import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared_widgets/login_signup_page.dart';
import '../provider/login_screen_provider.dart';
import '../widgets/login_cart.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginScreenProvider>(
      create: (_) => LoginScreenProvider(context),
      child: const _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen();

  @override
  Widget build(BuildContext context) {
    return const LoginSignUpPage(child: LoginCart());
  }
}
