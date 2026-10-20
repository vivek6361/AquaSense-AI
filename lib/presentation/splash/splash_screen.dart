import 'dart:async';
import 'package:flutter/material.dart';
import '../../features/auth/startup_gate.dart';

class SplashScreen extends StatefulWidget {
 const SplashScreen({super.key});
 @override State<SplashScreen> createState()=>_SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
 Timer? timer;
 @override void initState(){super.initState();timer=Timer(const Duration(seconds:1),(){if(mounted)Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>const StartupGate()));});}
 @override void dispose(){timer?.cancel();super.dispose();}
 @override Widget build(BuildContext context)=>const Scaffold(backgroundColor:Color(0xff1E88E5),body:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
  Icon(Icons.water_drop,color:Colors.white,size:88),SizedBox(height:20),Text('AquaSense AI',style:TextStyle(color:Colors.white,fontSize:32,fontWeight:FontWeight.bold)),SizedBox(height:18),CircularProgressIndicator(color:Colors.white)
 ])));
}
