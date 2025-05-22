import 'package:flutter/material.dart';

void main() {
  runApp(FavoriteFieldsApp());
}

class FavoriteFieldsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FavoriteFieldsScreen(),
    );
  }
}

class FavoriteFieldsScreen extends StatefulWidget {
  @override
  _FavoriteFieldsScreenState createState() => _FavoriteFieldsScreenState();
}

class _FavoriteFieldsScreenState extends State<FavoriteFieldsScreen> {
  List<String> fields = [
    "AI",
    "Mobile App",
    "Programming",
    "Design",
    "Networking",
    "Security"
  ];

  List<String> selectedFields = [];

  void toggleField(String field) {
    setState(() {
      if (selectedFields.contains(field)) {
        selectedFields.remove(field);
      } else {
        selectedFields.add(field);
      }
    });
  }

  void _confirmSelection() {
    if (selectedFields.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select at least one field")),
      );
    } else {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomeScreen()),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          "Select favorite Track",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            TextField(
              decoration: InputDecoration(
                hintText: "Search for fields",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
            ),
            SizedBox(height: 24),

            Text(
              "Common Tracks",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Grid View of fields
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: fields.map((field) {
                  bool isSelected = selectedFields.contains(field);
                  return GestureDetector(
                    onTap: () => toggleField(field),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                        border: isSelected
                            ? Border.all(color: Colors.green, width: 2)
                            : null,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.widgets, size: 36),
                          SizedBox(height: 8),
                          Text(
                            field,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          ),
                          if (isSelected)
                            Icon(Icons.check_circle, color: Colors.green, size: 18),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // Confirm button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _confirmSelection,
                child: Text("Confirm", style: TextStyle(fontSize: 25, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}


