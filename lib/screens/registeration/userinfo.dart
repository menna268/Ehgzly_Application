import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/registeration/favtrack.dart';
import 'package:image_picker/image_picker.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  String? _selectedAge;
  String? _selectedCountry;
  File? _profileImage;

  final List<String> _ages = List.generate(83, (index) => (18 + index).toString());
  final List<String> _countries = ['Egypt', 'USA', 'UK', 'Germany', 'India'];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _profileImage = File(picked.path));
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() &&
        _selectedAge != null &&
        _selectedCountry != null) {
    
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FavoriteFieldsApp()),
      );
    } else {
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all required fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Your info'), backgroundColor: Colors.white, foregroundColor: Colors.black),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Profile Picture", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
              SizedBox(height: 20),
              Row(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                      child: _profileImage == null
                          ? Icon(Icons.person, size: 35, color: Colors.black54)
                          : null,
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: Icon(Icons.upload),
                    label: Text("Add Profile Picture"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // First Name
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name', filled: true, fillColor: Colors.grey[200]),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 16),

              // Last Name
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name', filled: true, fillColor: Colors.grey[200]),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 16),

              // Age Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Age', filled: true, fillColor: Colors.grey[200]),
                value: _selectedAge,
                items: _ages.map((age) {
                  return DropdownMenuItem(value: age, child: Text(age));
                }).toList(),
                onChanged: (value) => setState(() => _selectedAge = value),
                validator: (value) => value == null ? 'Required' : null,
              ),
              SizedBox(height: 16),

              // Country Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Country', filled: true, fillColor: Colors.grey[200]),
                value: _selectedCountry,
                items: _countries.map((country) {
                  return DropdownMenuItem(value: country, child: Text(country));
                }).toList(),
                onChanged: (value) => setState(() => _selectedCountry = value),
                validator: (value) => value == null ? 'Required' : null,
              ),
              SizedBox(height: 50),

              // Confirm Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text("Confirm", style: TextStyle(fontSize: 25)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////
// صفحة Success التالية – يمكنك تعديلها كما تشاء لاحقًا:
class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Success"), backgroundColor: Colors.white, foregroundColor: Colors.black),
      body: Center(
        child: Text(
          "Registration Complete!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
