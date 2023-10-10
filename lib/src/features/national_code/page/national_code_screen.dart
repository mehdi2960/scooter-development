import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/features/national_code/provider/national_code_screen_provider.dart';
import 'package:scooter/src/features/national_code/widgets/national_code_cart.dart';
import '../../shared_widgets/login_signup_page.dart';

class NationalCodeScreen extends StatelessWidget {
  const NationalCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NationalCodeProvider>(
      create: (_) => NationalCodeProvider(context),
      child: const _NationalCodeScreen(),
    );
  }
}

class _NationalCodeScreen extends StatelessWidget {
  const _NationalCodeScreen();

  @override
  Widget build(BuildContext context) {
    return const LoginSignUpPage(child: NationalCodeCart());
  }
}
