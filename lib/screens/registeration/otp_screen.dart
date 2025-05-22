import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/registeration/submitOtp.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  final _formKey = GlobalKey<FormState>();
  String? errorText;

  void onConfirm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SubmitOtpScreen()),
      );
    } else {
      setState(() {
        errorText = "Please fill all fields.";
      });
    }
  }

  void resendCode() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("OTP Code Resent")),
    );
  }

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
              const SizedBox(height: 10),
              Image.asset(
                'asset/imges/otp.png', 
                height: 200,
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
              Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: 50,
                      child: TextFormField(
                        controller: controllers[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        decoration: const InputDecoration(
                          counterText: '',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value == null || value.isEmpty ? '' : null,
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: resendCode,
                child: const Text("Resend", style: TextStyle(color: Colors.black),),
              ),
              if (errorText != null)
                Text(errorText!, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onConfirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text("Confirm",style: TextStyle(color: Colors.white, fontSize: 25),),
                ),
              ),
            SizedBox(height: 15,),
              const Text("Already have an account"),
            ],
          ),
        ),
      ),
    );
  }
}
