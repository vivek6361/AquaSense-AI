import 'package:flutter/material.dart';
import '../../services/aqua_api.dart';
import '../legal/legal_screen.dart';
import '../navigation/navigation_screen.dart';

class AuthScreen extends StatefulWidget {
 const AuthScreen({super.key});
 @override State<AuthScreen> createState()=>_AuthScreenState();
}
class _AuthScreenState extends State<AuthScreen> {
 final form=GlobalKey<FormState>();
 final name=TextEditingController(),email=TextEditingController(),password=TextEditingController();
 bool register=false,busy=false,obscure=true;
 String? error;
 @override void dispose(){name.dispose();email.dispose();password.dispose();super.dispose();}
 String? checkEmail(String? v)=>v!=null && RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(v.trim())?null:'Enter a valid email.';
 String? checkPassword(String? v){if(v==null||v.isEmpty)return'Enter your password.';if(register&&v.length<8)return'Use at least 8 characters.';if(v.length>72)return'Password is too long.';return null;}
 Future<void> submit() async {
  if(!form.currentState!.validate())return;
  setState(() { busy = true; error = null; });
  try{
   if(register) await AquaApi.instance.register(name.text.trim(),email.text.trim(),password.text);
   final result=await AquaApi.instance.login(email.text.trim(),password.text);
   if(!mounted)return;
   final user=result['user'] as Map<String,dynamic>? ?? {};
   Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>NavigationScreen(userName:user['name'] as String? ?? 'AquaSense user')));
  } on AquaApiException catch(e){if(mounted)setState(()=>error=e.message);}
    catch(_){if(mounted)setState(()=>error='Something went wrong. Please try again.');}
  finally{if(mounted)setState(()=>busy=false);}
 }
 @override Widget build(BuildContext context)=>Scaffold(body:SafeArea(child:Center(child:ConstrainedBox(
  constraints:const BoxConstraints(maxWidth:480),child:SingleChildScrollView(padding:const EdgeInsets.all(24),child:Form(key:form,child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
   const Icon(Icons.water_drop,color:Colors.blue,size:64),const SizedBox(height:12),
   Text(register?'Create your account':'Welcome to AquaSense',textAlign:TextAlign.center,style:Theme.of(context).textTheme.headlineSmall),
   const SizedBox(height:24),
   if(error!=null) Container(padding:const EdgeInsets.all(12),color:Colors.red.shade50,child:Semantics(liveRegion:true,child:Text(error!,style:TextStyle(color:Colors.red.shade900)))),
   if(register) ...[TextFormField(controller:name,decoration:const InputDecoration(labelText:'Name',border:OutlineInputBorder()),validator:(v)=>v==null||v.trim().isEmpty?'Enter your name.':null),const SizedBox(height:12)],
   TextFormField(controller:email,keyboardType:TextInputType.emailAddress,decoration:const InputDecoration(labelText:'Email',border:OutlineInputBorder()),validator:checkEmail),
   const SizedBox(height:12),
   TextFormField(controller:password,obscureText:obscure,decoration:InputDecoration(labelText:'Password',border:const OutlineInputBorder(),suffixIcon:IconButton(onPressed:()=>setState(()=>obscure=!obscure),icon:Icon(obscure?Icons.visibility:Icons.visibility_off))),validator:checkPassword),
   const SizedBox(height:18),
   FilledButton(onPressed:busy?null:submit,child:busy?const SizedBox(height:20,width:20,child:CircularProgressIndicator(strokeWidth:2)):Text(register?'Create account':'Sign in')),
   TextButton(onPressed:busy?null:()=>setState(() { register = !register; error = null; }),child:Text(register?'Already registered? Sign in':'Create an account')),
   Wrap(alignment:WrapAlignment.center,children:[
    TextButton(onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const LegalScreen(page:LegalPage.privacy))),child:const Text('Privacy policy')),
    TextButton(onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const LegalScreen(page:LegalPage.terms))),child:const Text('Terms')),
   ]),
   const Text('Password reset and email verification need an email delivery provider before they can be enabled.',textAlign:TextAlign.center,style:TextStyle(fontSize:12,color:Colors.black54)),
  ]))))));
}
