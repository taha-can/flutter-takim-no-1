import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:takasla/features_notifications/screens/notifications_screen.dart';
import 'package:takasla/features_offers/screens/offers_screen.dart';
import 'package:takasla/features_trade/screens/trade_screen.dart';
import 'package:takasla/features_trade/screens/trade_screen_welcome.dart';
import 'package:takasla/features_user_profile/screens/profile_screen.dart';
import 'package:takasla/main/constants.dart';



import '../../features_home/screens/home_screen.dart';
import '../../widgets/main_body_appbar.dart';



class MainBodyScreen extends StatefulWidget {
   MainBodyScreen({Key? key}) : super(key: key);

  @override
  State<MainBodyScreen> createState() => _MainBodyScreenState();
}

class _MainBodyScreenState extends State<MainBodyScreen> {
  final List<Widget> ListOfScreenWidgets = [HomeScreen(),NotificationsScreen(),WelcomeTradeScreen(),OffersScreen(),ProfileScreen(),ProfileScreen()];
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMainScreenAppBar(context),
      body: ListOfScreenWidgets[_selectedIndex],
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  buildBottomNavigation() {
    return BottomNavigationBar(
      iconSize: 30,
      backgroundColor: Colors.black,
      selectedFontSize: 15,
      unselectedFontSize: 15,
      unselectedItemColor:colorOfMainTheme, items: [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'AnaSayfa'),
      BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Bildirimler'),
      BottomNavigationBarItem(icon: Icon(Icons.repeat),label: 'Takasla'),
      BottomNavigationBarItem(icon: Icon(Icons.local_offer),label: 'Tekliflerim'),
      BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profilim'),

    ],

      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black45,
      onTap: _onItemTapped,
    );
  }
}
