import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddSpaceScreen extends StatefulWidget {
  const AddSpaceScreen({super.key});

  @override
  State<AddSpaceScreen> createState() => _AddSpaceScreenState();
}

class _AddSpaceScreenState extends State<AddSpaceScreen> {
  File? _image;
  final picker = ImagePicker();
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _spaceNumberController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final List<String> selectedFeatures = [];

  final Map<String, List<String>> features = {
    'Technology': [
      'High-speed internet (Wi-Fi)',
      'Display screens / Projector',
      'Power outlets everywhere',
      'Speakers / Sound system',
      'Printer / Scanner',
      'Air conditioning / Heating',
    ],
    'Comfort & Setup': [
      'Ergonomic chairs for long work hours',
      'Individual or shared desks',
      'Good natural lighting',
      'Quiet and distraction-free environment',
    ],
    'Security & Organization': [
      'Safe for personal belongings',
      'Security cameras',
      'Access with code or magnetic card',
      'Personal lockers',
    ],
  };

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _image = File(pickedFile.path));
    }
  }

  void _AddSpace() {
    String message = 'Image selected: ${_image != null ? "Yes" : "No"}\n'
        'Capacity: ${_capacityController.text}\n'
        'Space Number: ${_spaceNumberController.text}\n'
        'Price per Hour: ${_priceController.text}\n'
        'Selected Features: ${selectedFeatures.join(', ')}';

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Space Info'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget buildFeatureGroup(String title, List<String> items) {
    return ExpansionTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      children: items.map((item) {
        final isSelected = selectedFeatures.contains(item);
        return CheckboxListTile(
          value: isSelected,
          onChanged: (val) {
            setState(() {
              if (val == true) {
                selectedFeatures.add(item);
              } else {
                selectedFeatures.remove(item);
              }
            });
          },
          title: Text(item),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Space')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[300],
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : const Icon(Icons.add_a_photo, size: 50),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _capacityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Capacity'),
            ),
            TextField(
              controller: _spaceNumberController,
              decoration: const InputDecoration(labelText: 'Space Number'),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Price per hour'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Workspace Features & Amenities',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ...features.entries.map((e) => buildFeatureGroup(e.key, e.value)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _AddSpace,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 12), // اختياري: لتكبير الزر
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Add Space'),
            ),
          ],
        ),
      ),
    );
  }
}
