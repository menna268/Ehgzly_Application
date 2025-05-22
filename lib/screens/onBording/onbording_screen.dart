import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Widgets/btn.dart';
class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 64,
            ),
            const Image(
                image: AssetImage(
                  "asset/imges/on_boarding_image.png")),
            const SizedBox(
              height: 8,
            ),
            const Column(
              children: [
                Text(
                 "Welcome to Ehgezly!",
                  textAlign: TextAlign.center,
                  style:TextStyle(
                      fontSize: 37,
    fontWeight: FontWeight.bold,
    color: Color(0xADABABAD),
                  )
                  
                ),
                 SizedBox(
                  height: 8,
                ),
                Text(
                   "Book courses and workspaces easily all in one place." ,
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    fontSize: 18,
                   color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: btn(
                  backgroundColor:Colors.black,
                  label: "Register",
                  textColor: Colors.white,
                  onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                  },
                )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: btn(
                  backgroundColor:const Color(0xADABABAD),
                  label: "Login" ,
                  textColor:Colors.black,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                ))
              ],
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      )),
    );
  }
}