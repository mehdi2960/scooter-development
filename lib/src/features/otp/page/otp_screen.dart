import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/features/otp/provider/verify_otp_provider.dart';
import '../../shared_widgets/login_signup_page.dart';
import '../widgets/otp_cart.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.isLoginScreen});
  final bool? isLoginScreen;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OtpProvider>(
      create: (_) => OtpProvider(context, isLoginScreen),
      child: _OTPScreen(),
    );
  }
}

class _OTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const LoginSignUpPage(
      child: OtpCart(),
    );
  }
}
