import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> courses = [
    {'name': 'CCNA', 'image': 'asset/imges/ccna.png'},
    {'name': 'C++', 'image': 'asset/imges/c++.png'},
    {'name': 'C#', 'image': 'asset/imges/c#.png'},
    {'name': 'HTML', 'image': 'asset/imges/html.png'},
    {'name': 'Deutsch', 'image': 'asset/imges/deutch.png'},
  ];

  final List<Map<String, String>> messages = [
    {'sender': 'Eng/Aseel', 'message': 'Sorry, the course will be delayed 30 minutes tomorrow.'},
    {'sender': 'student2', 'message': 'Sorry, the course will be delayed 30 minutes tomorrow.'},
    {'sender': 'Eng/Iman', 'message': 'Sorry, the course will be delayed 30 minutes tomorrow.'},
  ];

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      messages.add({
        'sender': 'You', // يمكنك تغييره لاسم المستخدم الحقيقي
        'message': _messageController.text.trim(),
      });
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Text('Samy mahmoud'),
                trailing: Icon(Icons.edit),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(courses[index]['image']!),
                      ),
                      title: Text(courses[index]['name']!),
                      subtitle: Text("Final of course is ..."),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('groupe_name'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(child: Text(messages[index]['sender']![0])),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(messages[index]['sender']!, style: TextStyle(fontWeight: FontWeight.bold)),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(messages[index]['message']!),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "ask...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
