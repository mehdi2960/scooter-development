import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import '/src/routes/routes_path.dart';
import '/src/services/storage.dart';

class OnboardingScreenProvider extends SafeChangeNotifier {
  OnboardingScreenProvider(this.context);

  final BuildContext context;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final PageController pageController = PageController();

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void goToNextPage() {
    if (_currentIndex < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    } else {
      goToLoginScreen();
    }
  }

  Future<void> goToLoginScreen() async {
    //set deviceId
    await Storage.instance.setFirstTime(false);
    context.pushReplacement(RoutesPath.login);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
