import 'package:flutter/material.dart';

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
        icon: Icon(Icons.grid_view_outlined, size: 30, color: Color(0xFF808080)),
        selectedIcon: Icon(Icons.grid_view, size: 30, color: Colors.black),
        label: "Tracks",
      ),
      NavigationDestination(
        icon: Icon(Icons.chat_bubble_outline_outlined, size: 30, color: Color(0xFF808080)),
        selectedIcon: Icon(Icons.chat_bubble, size: 30, color: Colors.black),
        label: 'Chat',
      ),
      NavigationDestination(
        icon: Icon(Icons.person_outline_outlined, size: 30, color: Color(0xFF808080)),
        selectedIcon: Icon(Icons.person, size: 30, color: Colors.black),
        label: 'Profile',
      ),
    ],
  );
}
