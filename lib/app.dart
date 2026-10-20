import 'package:flutter/material.dart';
import 'features/auth/startup_gate.dart';
import 'presentation/splash/splash_screen.dart';
import 'core/theme/app_theme.dart';

class AquaSenseApp extends StatelessWidget {
 const AquaSenseApp({super.key});
 @override Widget build(BuildContext context)=>MaterialApp(
  title:'AquaSense AI',debugShowCheckedModeBanner:false,themeMode:ThemeMode.light,theme:AppTheme.lightTheme,
  onUnknownRoute:(_)=>MaterialPageRoute<void>(builder:(_)=>const Scaffold(body:Center(child:Text('Page not found')))),
  home:const SplashScreen(),
 );
}
