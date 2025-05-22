import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/WorkSpace/bottom_navigation.dart';
import 'package:flutter_application_1/screens/home/WorkSpace/workspace_home.dart';
import 'package:flutter_application_1/screens/home/student&instructor/home_ST-INS.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Map<String, String> testAccounts = {
    'instructor@example.com': '123456',
    'student@example.com': '123456',
    'workspace@example.com': '123456',
  };

  String? errorText;

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (testAccounts.containsKey(email)) {
      if (testAccounts[email] == password) {
        setState(() {
          errorText = null;
        });

        Widget nextScreen;

        if (email == 'student@example.com') {
          nextScreen = MainPage(email: email);
        } else if (email == 'instructor@example.com') {
          nextScreen = MainPage(email: email);
        } else {
          nextScreen = Home_workspace();
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => nextScreen),
        );
      } else {
        setState(() {
          errorText = 'Incorrect password';
        });
      }
    } else {
      setState(() {
        errorText = 'Email not found';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'Login here',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 70),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forgot your password?"),
                ),
              ),
              SizedBox(height: 30),
              if (errorText != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    errorText!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Create new account ? "),
                    Text(
                      "signup.",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("or sign up whith"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.apple, size: 32),
                  Icon(Icons.g_mobiledata, size: 32),
                  Icon(Icons.facebook, size: 32),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

