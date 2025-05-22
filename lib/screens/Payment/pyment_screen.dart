import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PymentScreen extends StatefulWidget {
  const PymentScreen({super.key});

  @override
  State<PymentScreen> createState() => _PymentScreenState();
}

class _PymentScreenState extends State<PymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Row(
          children: [
            Text(
              "Course price",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 80,
            ),
            Text("899.99\$"),
          ],
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.all(15),
              child: Row(
                children: [
                  Image.asset(
                    "asset/imges/rose.png",
                    height: 170,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "asset/imges/blue.png",
                    height: 170,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "asset/imges/darkblue.png",
                    height: 170,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 213, 213, 213),
                      borderRadius: BorderRadius.circular(7)),
                  child: SvgPicture.asset("asset/imges/paypal.svg")),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "PayPal",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("Enter Paypal Account", style: TextStyle(fontSize: 10))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 213, 213, 213),
                      borderRadius: BorderRadius.circular(7)),
                  child: SvgPicture.asset("asset/imges/Visa.svg")),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "PayPal",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("Enter Phone Number", style: TextStyle(fontSize: 10))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 213, 213, 213),
                      borderRadius: BorderRadius.circular(7)),
                  child: SvgPicture.asset("asset/imges/Stripe.svg")),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "PayPal",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("Enter Paypal Account", style: TextStyle(fontSize: 10))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 160,
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Column(
                        children: [
                          Image.asset("asset/imges/right.png"),
                          Text("Order Success!"),
                        ],
                      ),
                      content: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid"),
                      actions: [
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 1, 35, 64)),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.only(
                                      left: 50,
                                      right: 50,
                                      top: 20,
                                      bottom: 20)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                            child: Text(
                              "Enroll Now",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.black),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(
                  EdgeInsets.only(left: 130, right: 130, top: 20, bottom: 20)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
            ),
            child: Text(
              "Buy Now",
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
