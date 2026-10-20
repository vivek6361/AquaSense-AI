import 'package:flutter/material.dart';
import '../../services/aqua_api.dart';
import '../navigation/navigation_screen.dart';
import '../onboarding/onboarding_screen.dart';
import 'auth_screen.dart';

class StartupGate extends StatefulWidget {
 const StartupGate({super.key});
 @override State<StartupGate> createState()=>_StartupGateState();
}
class _StartupGateState extends State<StartupGate> {
 @override void initState(){super.initState();route();}
 Future<void> route() async {
  Widget next;
  if(!await AquaApi.instance.onboardingComplete()) next=const OnboardingScreen();
  else {
   try {final u=await AquaApi.instance.me();next=NavigationScreen(userName:u['name'] as String? ?? 'AquaSense user');}
   catch(_){await AquaApi.instance.signOut();next=const AuthScreen();}
  }
  if(mounted)Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>next));
 }
 @override Widget build(BuildContext context)=>const Scaffold(body:Center(child:CircularProgressIndicator()));
}
