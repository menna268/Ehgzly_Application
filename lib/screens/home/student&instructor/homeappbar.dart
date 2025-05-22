import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Notification/note.dart';

PreferredSizeWidget buildCustomAppBar({String username = 'Nourhan', required VoidCallback onMenuPressed,}) {
  
  //بتحكم في طول الاسم علشان ميبقاش زايد
  String displayName =
      username.length > 8 ? '${username.substring(0, 6)}..' : username;

  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        Image.asset("asset/imges/Logo.png", width: 80),
        const SizedBox(width: 8),

        Text(
          'Welcome $displayName',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    actions: [
  Builder(
    builder: (context) => IconButton(
      icon: const Icon(Icons.notifications_none, color: Colors.black),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NotificationsScreen()),
        );
      },
    ),
  ),
      IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: onMenuPressed,
      ),
    ],
  );
}
