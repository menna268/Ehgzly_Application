import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? _profileImage;
  final List<String> _skills = [];
  final TextEditingController _skillController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  @override
  void dispose() {
    _skillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? const Icon(Icons.person, size: 60)
                      : null,
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: _pickImage,
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildTextField(label: "First Name", initialValue: "Mariam"),
            _buildTextField(label: "Last Name", initialValue: "Hany"),
            _buildTextField(label: "Email", initialValue: "Mariam@gmail.com"),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: '20',
                    items: List.generate(100, (i) => '${i + 1}')
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    decoration: const InputDecoration(labelText: 'Age'),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'Egypt',
                    items: ['Egypt', 'USA', 'UK', 'Germany']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    decoration: const InputDecoration(labelText: 'Country'),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildTextField(
              label: "Academic Year",
              initialValue: "Second-year undergraduate",
            ),
            const SizedBox(height: 20),
            _buildSkillsSection(),
            const SizedBox(height: 20),
            _buildTextField(
              label: "Learning Goals",
              initialValue:
                  "Full-stack developer and coding mentor with a strong background in JavaScript, React, and Node.js.",
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // سيتم حفظ التعديلات هنا لاحقًا
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  "Save Changes",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    String? initialValue,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        initialValue: initialValue,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Skills", style: TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _skills
              .map((skill) => Chip(
                    label: Text(skill),
                    deleteIcon: const Icon(Icons.close),
                    onDeleted: () {
                      setState(() {
                        _skills.remove(skill);
                      });
                    },
                  ))
              .toList(),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _skillController,
                decoration: const InputDecoration(
                  labelText: "Add a skill",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                final skill = _skillController.text.trim();
                if (skill.isNotEmpty && !_skills.contains(skill)) {
                  setState(() {
                    _skills.add(skill);
                    _skillController.clear();
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // لون الخلفية
                foregroundColor: Colors.white, // لون النص
              ),
              child: const Text("Add"),
            )
          ],
        ),
      ],
    );
  }
}
