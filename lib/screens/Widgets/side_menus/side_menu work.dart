import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SideMenu_work extends StatefulWidget {
  const SideMenu_work({super.key});

  @override
  State<SideMenu_work> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu_work> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30, left: 20),
            child: const Row(
              children: [
                Icon(
                  CupertinoIcons.profile_circled,
                  color: Color.fromARGB(255, 235, 142, 2),
                  size: 50,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Nook workspace",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 90), child: Text("workspace")),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 30,
            height: 230,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(2, 2),
                blurRadius: 2,
                spreadRadius: 2,
              ),
            ]),
            child: Column(
              children: [
                ListTile(
                  title: const Row(
                    children: [
                      Icon(
                        Icons.home_outlined,
                        size: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Home")
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/workspace');
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 25,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("settings")
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/setting');
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        size: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Balance")
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/balance');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 260,
          ),
          ListTile(
            title:  Column(
              children: [
                  ListTile(
                  title: const Row(
                    children: [
                      Icon(
                        Icons.support_agent,
                        size: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("support")
                    ],
                  ),
                  onTap: () {
                  Navigator.of(context).pushNamed('/support');
                  },
                ),
              
                SizedBox(
                  height: 15,
                ),
                  ListTile(
                  title: const Row(
                    children: [
                      Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Logout",style: TextStyle(color: Colors.orange,),)
                    ],
                  ),
                  onTap: ()async {
                      
                     Navigator.of(context).pushNamedAndRemoveUntil("/login", (Route <dynamic> route)  => false);
                  },
                ),
              
              
        ],
      ),
    )]));
  }
}
