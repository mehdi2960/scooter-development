import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/src/constants/strings.dart';
import '/src/routes/routes.dart';
import 'features/shared_providers/setup_providers.dart';
import 'features/shared_providers/theme_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: GlobalProviders.providers,
      child: Consumer<ThemeProvider>(
        builder: (_, ThemeProvider themeProvider, __) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            theme: themeProvider.themeData,
            themeMode: themeProvider.selectedThemeMode,
            routerConfig: Routes.router,
          );
        },
      ),
    );
  }
}
