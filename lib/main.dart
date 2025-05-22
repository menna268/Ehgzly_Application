import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Catigory/catigory.dart';
import 'package:flutter_application_1/screens/Chat/chatscreen.dart';
import 'package:flutter_application_1/screens/Login/login_screen.dart';
import 'package:flutter_application_1/screens/Notification/note.dart';
import 'package:flutter_application_1/screens/Profile/editprofile.dart';
import 'package:flutter_application_1/screens/Profile/profile.dart';
import 'package:flutter_application_1/screens/Widgets/settings_screen.dart';
import 'package:flutter_application_1/screens/Widgets/support.dart';
import 'package:flutter_application_1/screens/home/WorkSpace/balance.dart';
import 'package:flutter_application_1/screens/home/WorkSpace/workspace_home.dart';
import 'package:flutter_application_1/screens/home/student&instructor/YourCourses/addcourse.dart';
import 'package:flutter_application_1/screens/home/student&instructor/home_ST-INS.dart';

import 'package:flutter_application_1/screens/onBording/onbording_screen.dart';
import 'package:flutter_application_1/screens/registeration/otp_screen.dart';
import 'package:flutter_application_1/screens/registeration/register_screen.dart';
import 'package:flutter_application_1/screens/registeration/success_screen.dart';
import 'package:flutter_application_1/screens/Splash/splash.dart';
import 'package:flutter_application_1/screens/registeration/userinfo.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) =>  Splash(),
        
        '/onboarding': (context) =>  const OnBoarding(),
        '/login': (context) =>  const LoginScreen(),
        '/register': (context) =>  const RegisterScreen(),
        '/otp': (context) =>  const OtpScreen(),
        '/success': (context) =>  const SuccessScreen(),
        '/profile': (context) =>  ProfilePage(),
        '/Editpro': (context) => const EditProfilePage(),
        '/workspace': (context) =>  Home_workspace(),
        '/support': (context) => const Support(),
        '/setting': (context) => SettingsScreen() ,
        '/chat': (context) =>  ChatScreen(),
        '/info': (context) =>  UserInfoPage(),
        '/balance': (context) => const BalancePage(),
        '/note': (context) => const NotificationsScreen(),
        '/home': (context) =>  HomeSt_INS(),
        '/add': (context) =>const AddCourse(),
        '/caat': (context) => CategoriesApp(),
      },
    );
  }
}














































      // appBar: AppBar(
      //     title: Padding(
      //       padding: const EdgeInsets.only(bottom: 0.30),
      //       child: Text(
      //         "Your Info", 
      //         style: TextStyle(
      //           decoration: TextDecoration.underline,
      //           decorationColor: const Color.fromARGB(255, 12, 116, 201),
      //           height: 6,
      //           decorationThickness: 2,
      //          color: const Color.fromARGB(255, 5, 71, 125),
      //          fontSize: 40,
      //          fontWeight: FontWeight.w600,
               
      //         ),
      //             ),
      //     ),
      
      
      // ),
      // body: Column(
      //   children: [
      //     Container(
      //       margin: EdgeInsets.only(left:22),
      //     alignment: Alignment.centerLeft,
      //       child: Text(
      //         "Profile Picture",
      //         style: TextStyle(fontSize: 20, ),
      //         ),
      //     ),
      //   Container(
      //     alignment: Alignment.center,
      //     child: Icon(CupertinoIcons.profile_circled, size: 130,color: Colors.grey,)
      //     ), 
      //     SizedBox(height:20),
      //     Container(
      //       margin: EdgeInsets.only(left:22),
      //     alignment: Alignment.centerLeft,
      //       child: Text("First Name")
      //       ),
      //   ],
      // ),
    

