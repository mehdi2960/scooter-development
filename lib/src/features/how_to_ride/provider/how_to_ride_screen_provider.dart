import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import '/src/routes/routes_path.dart';

class HowToRideScreenProvider extends SafeChangeNotifier {
  HowToRideScreenProvider(this.context);

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
      goTohomePage();
    }
  }

  void goToPreviousPage() {
    if (_currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  Future<void> goTohomePage() async {
    context.pushReplacement(RoutesPath.home);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
