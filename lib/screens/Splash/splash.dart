import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/onBording/onbording_screen.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
     super.initState();

  
  
    Future.delayed(const Duration(seconds: 7), () async {
    
    
      if (mounted) {
      Navigator.of(context).pushNamed('/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffffffff),
              Color(0xFFE0E0E0),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.scale(
                  scale: 0.9,
                  child: Image.asset(
                    "asset/imges/logoapp.png",
                    height: 300,
                  )),
               const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(15),
                child: const Center(
                  child: Text(
                    "Ehgezly... Instructor? Check. Space? Check. Just hit start!",
                    style: TextStyle(
                      color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
               const SizedBox(height: 30),
               const SizedBox(
                width: 50,
                height: 20,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse,
                  colors: [Colors.black],
                  strokeWidth: 2,
                  backgroundColor: Colors.transparent,
                  pathBackgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}