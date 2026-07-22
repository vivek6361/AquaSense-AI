import 'package:flutter/material.dart';
import 'features/splash/splash_screen.dart';

class AquaSenseApp extends StatelessWidget {
  const AquaSenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AquaSense AI',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),

      home: const SplashScreen(),
    );
  }
}