import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final String _defaultAvatarUrl = "https://ui-avatars.com/api/?name=User&background=0D8ABC&color=fff";
  String _cachedUsername = "John Doe"; // بيانات وهمية بدل Firebase
  String _currentUserRole = "Student"; // قيمة ثابتة مؤقتة
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
  
    _profileImageUrl = null; 
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: const ValueKey('main_drawer'),
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 28),
          _buildHeader(_cachedUsername),
          Expanded(
            child: _buildMenuItems(context),
          ),
          const Divider(),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(String username) {
    return Container(
      key: const ValueKey('header_container'),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            key: const ValueKey('avatar'),
            radius: 24,
            backgroundImage: _profileImageUrl != null 
                ? NetworkImage(_profileImageUrl!)
                : NetworkImage(_defaultAvatarUrl),
            onBackgroundImageError: (exception, stackTrace) {
              print('Error loading profile image: $exception');
              setState(() {
                _profileImageUrl = null;
              });
            },
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  _currentUserRole,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return ListView(
      key: const ValueKey('menu_items_list'),
      padding: EdgeInsets.zero,
      children: [
        _buildMenuItem(
          key: const ValueKey('home_menu_item'),
          icon: Icons.home,
          title: 'Home Page',
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/home");
          },
        ),
        
        _buildMenuItem(
          key: const ValueKey('profile_menu_item'),
          icon: Icons.person,
          title: 'Profile',
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/profile");
          },
        ),
        _buildMenuItem(
          key: const ValueKey('settings_menu_item'),
          icon: Icons.settings,
          title: 'Settings',
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/setting");
          },
        ),
      
        _buildMenuItem(
          key: const ValueKey('chat_menu_item'),
          icon: Icons.chat,
          title: 'Chat',
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/chat");
          },
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required Key key,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      key: key,
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      key: const ValueKey('footer_column'),
      children: [
        _buildMenuItem(
          key: const ValueKey('support_menu_item'),
          icon: Icons.help,
          title: 'Support',
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/support");
          },
        ),
        _buildMenuItem(
          key: const ValueKey('logout_menu_item'),
          icon: Icons.logout,
          title: 'Logout',
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
          },
        ),
      ],
    );
  }
}
