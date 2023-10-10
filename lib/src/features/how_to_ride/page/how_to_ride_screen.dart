import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scooter/src/features/how_to_ride/provider/how_to_ride_screen_provider.dart';
import 'package:scooter/src/features/how_to_ride/widgets/how_to_ride_page_view.dart';

class HowToRideScreen extends StatelessWidget {
  const HowToRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HowToRideScreenProvider>(
      create: (_) => HowToRideScreenProvider(context),
      child: const _HowToRideScreen(),
    );
  }
}

class _HowToRideScreen extends StatelessWidget {
  const _HowToRideScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HowtoRideScreenPageView(),
    );
  }
}
