import 'package:flutter/material.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import '../../constants/styles/taal_styles.dart';
import '/src/services/storage.dart';

class ThemeProvider extends SafeChangeNotifier {
  ThemeMode selectedThemeMode = ThemeMode.system;

  ThemeData get themeData {
    final bool? themeMode = Storage.instance.themeMode;
    Brightness? brightness;
    switch (themeMode) {
      case true:
        brightness = Brightness.dark;
        selectedThemeMode = ThemeMode.dark;
        break;
      case false:
        brightness = Brightness.light;
        selectedThemeMode = ThemeMode.light;
        break;
      case null:
        brightness = null;
        selectedThemeMode = ThemeMode.system;
        break;
    }
    return ThemeData(
      brightness: brightness,
      fontFamily: 'YekanBakh',
      useMaterial3: true,
      splashColor: Colors.transparent,
      colorSchemeSeed: AppColors.primary,
    );
  }

  void setThemeMode(ThemeMode themeMode) {
    selectedThemeMode = themeMode;
    switch (themeMode) {
      case ThemeMode.dark:
        Storage.instance.setThemeMode(true);
        break;
      case ThemeMode.light:
        Storage.instance.setThemeMode(false);
        break;
      case ThemeMode.system:
        Storage.instance.setThemeMode(null);
        break;
    }
    notifyListeners();
  }
}
