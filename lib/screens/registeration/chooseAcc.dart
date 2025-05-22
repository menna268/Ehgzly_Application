import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/registeration/userinfo.dart';

void main() {
  runApp(ChooseAccountApp());
}

class ChooseAccountApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChooseAccountScreen(),
    );
  }
}

class ChooseAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20),
            // صورة في الأعلى
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'asset/imges/on_boarding_image.png',
                height: 250,
              ),
            ),

            Text(
              "Choose Account Type",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            // الأزرار
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AccountTypeButton(
                          label: "Student",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserInfoPage()),
                            );
                          }),
                      AccountTypeButton(
                          label: "Instructor",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserInfoPage()),
                            );
                          }),
                    ],
                  ),
                  SizedBox(height: 20),
                  AccountTypeButton(
                      label: "Work Space",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserInfoPage()),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountTypeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const AccountTypeButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
