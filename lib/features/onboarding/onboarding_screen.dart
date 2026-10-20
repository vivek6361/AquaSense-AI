import 'package:flutter/material.dart';
import '../../services/aqua_api.dart';
import '../auth/auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
 const OnboardingScreen({super.key});
 @override State<OnboardingScreen> createState()=>_OnboardingScreenState();
}
class _OnboardingScreenState extends State<OnboardingScreen> {
 final pager=PageController();int page=0;
 final items=const [(Icons.water_drop,'Understand your water','See water-quality readings and device status together.'),(Icons.insights,'Review your routine','Explore your intake history and trends.'),(Icons.shield_outlined,'Your account, your data','Sign in to keep personal records associated with your profile.')];
 Future<void> finish() async {await AquaApi.instance.markOnboardingComplete();if(mounted)Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>const AuthScreen()));}
 @override void dispose(){pager.dispose();super.dispose();}
 @override Widget build(BuildContext context)=>Scaffold(body:SafeArea(child:Padding(padding:const EdgeInsets.all(24),child:Column(children:[
  Align(alignment:Alignment.centerRight,child:TextButton(onPressed:finish,child:const Text('Skip'))),
  Expanded(child:PageView.builder(controller:pager,itemCount:items.length,onPageChanged:(v)=>setState(()=>page=v),itemBuilder:(_,i)=>Column(mainAxisAlignment:MainAxisAlignment.center,children:[
   Icon(items[i].$1,color:Colors.blue,size:80),const SizedBox(height:24),Text(items[i].$2,textAlign:TextAlign.center,style:Theme.of(context).textTheme.headlineSmall),const SizedBox(height:12),Text(items[i].$3,textAlign:TextAlign.center)
  ]))),
  Row(mainAxisAlignment:MainAxisAlignment.center,children:List.generate(items.length,(i)=>Container(width:i==page?20:8,height:8,margin:const EdgeInsets.all(4),decoration:BoxDecoration(color:i==page?Colors.blue:Colors.blue.shade100,borderRadius:BorderRadius.circular(8))))),
  const SizedBox(height:18),SizedBox(width:double.infinity,child:FilledButton(onPressed:page==items.length-1?finish:()=>pager.nextPage(duration:const Duration(milliseconds:250),curve:Curves.easeOut),child:Text(page==items.length-1?'Get started':'Continue')))
 ]))));
}
