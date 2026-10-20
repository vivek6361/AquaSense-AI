import 'package:flutter/material.dart';
enum LegalPage{privacy,terms}
class LegalScreen extends StatelessWidget {
 const LegalScreen({super.key,required this.page});final LegalPage page;
 @override Widget build(BuildContext context){final privacy=page==LegalPage.privacy;return Scaffold(
  appBar:AppBar(title:Text(privacy?'Privacy policy':'Terms of use')),
  body:ListView(padding:const EdgeInsets.all(20),children:[
   Container(color:Colors.amber.shade100,padding:const EdgeInsets.all(12),child:const Text('DRAFT — product owner review and approved final wording are required before public release.')),
   const SizedBox(height:16),Text(privacy?'Privacy policy':'Terms of use',style:Theme.of(context).textTheme.headlineSmall),
   const SizedBox(height:12),Text(privacy
    ?'AquaSense may process account details and information associated with app use, including device status and water or hydration records. This draft does not yet define final purposes, retention periods, service providers, or contact details. Do not rely on it as the production privacy notice.'
    :'Use AquaSense only with devices and services you are authorized to access. Readings and recommendations are informational; they do not certify that water is safe to drink or provide medical advice. Final warranty, governing law, support contact, and liability terms still need approval.'),
   const SizedBox(height:18),const Text('Before release, specify collected data, purposes, retention and deletion rules, processors, user rights, contact details, governing law, and effective date.')
  ]));
 }
}
