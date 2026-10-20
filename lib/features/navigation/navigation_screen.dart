import 'package:flutter/material.dart';
import '../../services/aqua_api.dart';
import '../analytics/analytics_screen.dart';
import '../auth/auth_screen.dart';
import '../device/device_screen.dart';
import '../history/history_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class NavigationScreen extends StatefulWidget {
 const NavigationScreen({super.key,this.userName='AquaSense user'});
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
  final screens=<Widget>[const HomeScreen(),const AnalyticsScreen(),const HistoryScreen(),const DeviceScreen(),
   ProfileScreen(userName:widget.userName,onSignOut:signOut)];
  return Scaffold(body:screens[currentIndex],bottomNavigationBar:NavigationBar(
   selectedIndex:currentIndex,onDestinationSelected:(i)=>setState(()=>currentIndex=i),
   destinations:const [
    NavigationDestination(icon:Icon(Icons.home_outlined),selectedIcon:Icon(Icons.home),label:'Home'),
    NavigationDestination(icon:Icon(Icons.analytics_outlined),selectedIcon:Icon(Icons.analytics),label:'Analytics'),
    NavigationDestination(icon:Icon(Icons.history_outlined),selectedIcon:Icon(Icons.history),label:'History'),
    NavigationDestination(icon:Icon(Icons.memory_outlined),selectedIcon:Icon(Icons.memory),label:'Device'),
    NavigationDestination(icon:Icon(Icons.person_outline),selectedIcon:Icon(Icons.person),label:'Profile'),
   ]));
 }
}
