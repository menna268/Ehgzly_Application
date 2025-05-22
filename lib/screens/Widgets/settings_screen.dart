import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool isNotificationOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
              radius: 30,
            ),
            title: Text("Amr Adel", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("Instructor\nPersonal Settings", style: TextStyle(height: 1.5)),
            isThreeLine: true,
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          SizedBox(height: 20),
          SwitchListTile(
            title: Text("Dark Mode"),
            secondary: Icon(Icons.nightlight_round),
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),
          SwitchListTile(
            title: Text("Notification"),
            secondary: Icon(Icons.notifications),
            value: isNotificationOn,
            onChanged: (value) {
              setState(() {
                isNotificationOn = value;
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("Language"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.support_agent),
            title: Text("Help And Support"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout", style: TextStyle(color: Colors.red)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.red),
            onTap: () {
              // كود تسجيل الخروج هنا
            },
          ),
        ],
      ),
    );
  }
}
