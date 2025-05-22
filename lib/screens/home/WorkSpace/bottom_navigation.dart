import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Catigory/catigory.dart';
import 'package:flutter_application_1/screens/Chat/chatscreen.dart';
import 'package:flutter_application_1/screens/Profile/profile.dart';
import 'package:flutter_application_1/screens/home/student&instructor/home_ST-INS.dart';

// ده الـ bottomNavigation اللي عندك
Widget bottomNavigation(int globalIndex, Function(int) onIndexChanged) {
  return NavigationBar(
    backgroundColor: Colors.white,
    selectedIndex: globalIndex,
    onDestinationSelected: (index) {
      onIndexChanged(index);
    },
    indicatorColor: Colors.transparent,
    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    destinations: const [
      NavigationDestination(
        icon: Icon(Icons.home_outlined, size: 30, color: Color(0xFF808080)),
        selectedIcon: Icon(Icons.home, size: 30, color: Colors.black),
        label: "Home",
      ),
      NavigationDestination(
        icon:
            Icon(Icons.grid_view_outlined, size: 30, color: Color(0xFF808080)),
        selectedIcon: Icon(Icons.grid_view, size: 30, color: Colors.black),
        label: "Tracks",
      ),
      NavigationDestination(
        icon: Icon(Icons.chat_bubble_outline_outlined,
            size: 30, color: Color(0xFF808080)),
        selectedIcon: Icon(Icons.chat_bubble, size: 30, color: Colors.black),
        label: 'Chat',
      ),
      NavigationDestination(
        icon: Icon(Icons.person_outline_outlined,
            size: 30, color: Color(0xFF808080)),
        selectedIcon: Icon(Icons.person, size: 30, color: Colors.black),
        label: 'Profile',
      ),
    ],
  );
}

// ده الـ Main Page
class MainPage extends StatefulWidget {
  final String email;
  MainPage({required this.email});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
 late List<Widget> _pages;
  // الصفحات الأربعة
   void initState() {
    super.initState();
    _pages = [
      HomeSt_INS(email: widget.email),  
      CategoriesScreen(),
      ChatScreen(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: bottomNavigation(_selectedIndex, (newIndex) {
        setState(() {
          _selectedIndex = newIndex;
        });
      }),
    );
  }
}
