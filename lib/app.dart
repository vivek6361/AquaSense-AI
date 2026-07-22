import 'package:flutter/material.dart';
import 'presentation/splash/splash_screen.dart';
import 'core/theme/app_theme.dart';

class AquaSenseApp extends StatelessWidget {
  const AquaSenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AquaSense AI',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,

     theme: AppTheme.lightTheme,

      home: const SplashScreen(),
    );
  }
}