import 'package:flutter/material.dart';
import '../../services/aqua_api.dart';
import '../analytics/analytics_screen.dart';
import '../auth/auth_screen.dart';
import '../device/device_screen.dart';
import '../history/history_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class NavigationScreen extends StatefulWidget {
 const NavigationScreen({super.key,this.userName='AQVYNTRA user'});
 final String userName;
 @override State<NavigationScreen> createState()=>_NavigationScreenState();
}
class _NavigationScreenState extends State<NavigationScreen> {
 int currentIndex=0;
 Future<void> signOut() async {
  await AquaApi.instance.signOut();
  if(!mounted)return;
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(_)=>const AuthScreen()),(_)=>false);
 }
 @override Widget build(BuildContext context) {
  final screens=<Widget>[HomeScreen(userName:widget.userName,onNavigate:(i)=>setState(()=>currentIndex=i)),const AnalyticsScreen(),const HistoryScreen(),const DeviceScreen(),
   ProfileScreen(userName:widget.userName,onSignOut:signOut)];
  return LayoutBuilder(builder:(context,constraints) {
   final body=Column(children:[
    if(currentIndex<4) SafeArea(bottom:false,child:Container(
      width:double.infinity,padding:const EdgeInsets.symmetric(horizontal:20,vertical:10),
      color:const Color(0xFFFFF1D6),
      child:const Text('PREVIEW • Sample readings and activity. Device controls are not connected.',
        style:TextStyle(color:Color(0xFF684600),fontSize:12)),
    )),
    Expanded(child:IndexedStack(index:currentIndex,children:screens)),
   ]);
   if(constraints.maxWidth>=840) {
    return Scaffold(body:Row(children:[
     NavigationRail(selectedIndex:currentIndex,onDestinationSelected:(i)=>setState(()=>currentIndex=i),
      labelType:NavigationRailLabelType.all,destinations:const [
       NavigationRailDestination(icon:Icon(Icons.home_outlined),label:Text('Home')),
       NavigationRailDestination(icon:Icon(Icons.insights_outlined),label:Text('Analytics')),
       NavigationRailDestination(icon:Icon(Icons.history),label:Text('History')),
       NavigationRailDestination(icon:Icon(Icons.router_outlined),label:Text('Device')),
       NavigationRailDestination(icon:Icon(Icons.person_outline),label:Text('Profile')),
      ]),
     const VerticalDivider(width:1),
     Expanded(child:Center(child:ConstrainedBox(constraints:const BoxConstraints(maxWidth:1040),child:body))),
    ]));
   }
   return Scaffold(body:body,bottomNavigationBar:NavigationBar(
   selectedIndex:currentIndex,onDestinationSelected:(i)=>setState(()=>currentIndex=i),
   destinations:const [
    NavigationDestination(icon:Icon(Icons.home_outlined),selectedIcon:Icon(Icons.home),label:'Home'),
    NavigationDestination(icon:Icon(Icons.analytics_outlined),selectedIcon:Icon(Icons.analytics),label:'Analytics'),
    NavigationDestination(icon:Icon(Icons.history_outlined),selectedIcon:Icon(Icons.history),label:'History'),
    NavigationDestination(icon:Icon(Icons.memory_outlined),selectedIcon:Icon(Icons.memory),label:'Device'),
    NavigationDestination(icon:Icon(Icons.person_outline),selectedIcon:Icon(Icons.person),label:'Profile'),
   ]));
  });
 }
}
