import 'package:flutter/material.dart';
import '../legal/legal_screen.dart';

class ProfileScreen extends StatelessWidget {
 const ProfileScreen({super.key,required this.userName,required this.onSignOut});
 final String userName;
 final VoidCallback onSignOut;
 @override Widget build(BuildContext context)=>Scaffold(
  backgroundColor:const Color(0xffF5F9FF),
  appBar:AppBar(title:const Text('Profile'),centerTitle:true,backgroundColor:Colors.blue,foregroundColor:Colors.white),
  body:ListView(padding:const EdgeInsets.all(16),children:[
   const CircleAvatar(radius:42,backgroundColor:Colors.blue,child:Icon(Icons.person,color:Colors.white,size:42)),
   const SizedBox(height:12),Text(userName,textAlign:TextAlign.center,style:const TextStyle(fontSize:22,fontWeight:FontWeight.bold)),
   const SizedBox(height:5),const Text('AquaSense account',textAlign:TextAlign.center,style:TextStyle(color:Colors.grey)),
   const SizedBox(height:24),
   Card(child:Column(children:const [
    ListTile(leading:Icon(Icons.water_drop),title:Text('Daily Goal'),subtitle:Text('Set up your hydration goal in profile settings')),
    Divider(height:1),ListTile(leading:Icon(Icons.router),title:Text('Connected Device'),subtitle:Text('Manage your AquaSense device')),
   ])),
   const SizedBox(height:16),
   Card(child:Column(children:[
    ListTile(leading:const Icon(Icons.privacy_tip_outlined),title:const Text('Privacy policy'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const LegalScreen(page:LegalPage.privacy)))),
    const Divider(height:1),
    ListTile(leading:const Icon(Icons.description_outlined),title:const Text('Terms of use'),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const LegalScreen(page:LegalPage.terms)))),
   ])),
   const SizedBox(height:16),
   OutlinedButton.icon(onPressed:onSignOut,icon:const Icon(Icons.logout),label:const Text('Sign out')),
   const SizedBox(height:18),
   const Text('AquaSense AI • account and device readings may be informational only.',textAlign:TextAlign.center,style:TextStyle(color:Colors.black54,fontSize:12)),
  ]));
}
