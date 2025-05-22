import 'package:flutter/material.dart';


class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 231, 231, 231),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color:Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
             CircleAvatar(
              backgroundImage:
                  AssetImage('asset/imges/Avatar.png'),
              radius: 16,
            ),
             SizedBox(width: 8),
             Text(
              'support',
              style: TextStyle(
                color:Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding:  EdgeInsets.only(right: 30),
                child: Image.asset(
                  'asset/imges/Vector.png',
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.5,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color:Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color:Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(

                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'ask....',
                        border: InputBorder.none,
                        contentPadding:
                             EdgeInsets.symmetric(vertical: 10),
                            fillColor: const Color.fromARGB(255, 227, 227, 227),
                            
                      ),
                      
                    ),
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.send, color:Colors.grey),
                    onPressed: () {
                      // هضيف الحاجه اللي عاوزها تحصل بعد الضغط علي الزر
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
