import 'package:flutter/material.dart';

class SubmitOtpScreen extends StatelessWidget {
  const SubmitOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(height: 40),
              Image.asset(
                'asset/imges/otp.png', 
                height: 220,
              ),
              const SizedBox(height: 20),
              const Text(
                'OTP Verification',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'We sent you Email please check your\nMail and Complete OTP Code',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (_) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black12),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: const Text("Resend", style: TextStyle(color: Colors.black),),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                   Navigator.of(context).pushNamed('/success');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text("Confirm", style: TextStyle(color: Colors.white, fontSize: 25),),
                ),
              ),
              SizedBox(height: 10,),
              const Text("Already have an account"),
            ],
          ),
        ),
      ),
    );
  }
}
