// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/features/splash/provider/splash_screen_provider.dart';

import '../../shared_widgets/svg_box.dart';
import '../../shared_widgets/taal_name_and_version.dart';
import '../widgets/splash_screen_eclipse_background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashScreenProvider>(
      create: (_) => SplashScreenProvider(context),
      child: const _SplashScreen(),
    );
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    final SplashScreenProvider watch = context.watch<SplashScreenProvider>();

    return const Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SplashScreenEclipseBackground(),
          SvgBox(assetName: Assets.taalIcon),
          Positioned(bottom: 40, child: TaalNameAndVersion())
        ],
      ),
    );
  }
}
