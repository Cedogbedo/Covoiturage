import 'package:covoiturage/screens/historypage.dart';
import 'package:covoiturage/screens/mainscreen.dart';
import 'package:covoiturage/screens/profilpage.dart';
import 'package:covoiturage/screens/proposertrajet.dart';
import 'package:covoiturage/screens/recherchertrajet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covoiturage/main.dart';
import 'package:covoiturage/screens/loginpage.dart';
import 'package:covoiturage/screens/registration.dart';
import 'package:covoiturage/screens/databasemanager.dart';
import 'package:covoiturage/screens/newfindaride.dart';

class HomePage extends StatefulWidget {
  static const String idScreen = "homePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    MainScreen(),
    HitoryPage(),
    NewFindaride(),
    ProposerTrajetPage(),
    ProfilePage()
  ];
  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ("Home"),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: ("Historique"),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: ("Rechercher un trajet"),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: ("Proposer un trajet"),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ("Profil"),
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
