import 'package:flutter/material.dart';
import '../../services/aqua_api.dart';
import '../auth/auth_screen.dart';
import '../legal/legal_screen.dart';

class ProfileScreen extends StatelessWidget {
 const ProfileScreen({super.key,required this.userName,required this.onSignOut});
 final String userName;
 final VoidCallback onSignOut;

 Future<void> _deleteAccount(BuildContext context) async {
  final password=TextEditingController();
  final confirmed=await showDialog<bool>(context:context,builder:(dialogContext)=>AlertDialog(
   title:const Text('Delete AquaSense account?'),
   content:Column(mainAxisSize:MainAxisSize.min,children:[
    const Text('This permanently removes your account and personal records. Shared purifier records are retained without your account ownership. This cannot be undone.'),
    const SizedBox(height:12),
    TextField(controller:password,obscureText:true,decoration:const InputDecoration(labelText:'Confirm your password')),
   ]),
   actions:[
    TextButton(onPressed:()=>Navigator.pop(dialogContext,false),child:const Text('Cancel')),
    FilledButton(onPressed:()=>Navigator.pop(dialogContext,true),style:FilledButton.styleFrom(backgroundColor:Colors.red),child:const Text('Delete account')),
   ],
  ))??false;
  if(!confirmed){password.dispose();return;}
  try {
   await AquaApi.instance.deleteAccount(password.text);
   password.dispose();
   if(!context.mounted)return;
   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Your account was deleted.')));
   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(_)=>const AuthScreen()),(_)=>false);
  } on AquaApiException catch(e) {
   password.dispose();
   if(context.mounted)ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.message)));
  } catch(_) {
   password.dispose();
   if(context.mounted)ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Could not delete the account. Please try again.')));
  }
 }

 @override Widget build(BuildContext context)=>Scaffold(
  backgroundColor:const Color(0xffF5F9FF),
  appBar:AppBar(title:const Text('Profile'),centerTitle:true,backgroundColor:Colors.blue,foregroundColor:Colors.white),
  body:ListView(padding:const EdgeInsets.all(16),children:[
   const CircleAvatar(radius:42,backgroundColor:Colors.blue,child:Icon(Icons.person,color:Colors.white,size:42)),
   const SizedBox(height:12),Text(userName,textAlign:TextAlign.center,style:const TextStyle(fontSize:22,fontWeight:FontWeight.bold)),
   const SizedBox(height:5),const Text('AquaSense account',textAlign:TextAlign.center,style:TextStyle(color:Colors.grey)),
   const SizedBox(height:24),
   Card(child:Column(children:const [
    ListTile(leading:Icon(Icons.water_drop),title:Text('Daily Goal'),subtitle:Text('Manage your hydration profile')),
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
   const SizedBox(height:8),
   TextButton.icon(onPressed:()=>_deleteAccount(context),icon:const Icon(Icons.delete_outline,color:Colors.red),label:const Text('Delete account',style:TextStyle(color:Colors.red))),
   const SizedBox(height:18),
   const Text('AquaSense AI • readings and recommendations are informational.',textAlign:TextAlign.center,style:TextStyle(color:Colors.black54,fontSize:12)),
  ]));
}
