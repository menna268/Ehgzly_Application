import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/registeration/chooseAcc.dart';



class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();

    // بدء مؤقت 5 ثوانٍ ثم الانتقال إلى الصفحة التالية
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  ChooseAccountApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Successful', style: TextStyle(fontSize: 40)),
            SizedBox(height: 20),
            CircularProgressIndicator(), 
          ],
        ),
      ),
    );
  }
}
