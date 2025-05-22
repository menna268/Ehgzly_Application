import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddCourse extends StatefulWidget {
  const AddCourse({super.key});

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  File? _image;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _studentsController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedField;
  String? _selectedLevel;

  Future<void> _selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text =
          "${picked.day.toString().padLeft(2, '0')}/"
          "${picked.month.toString().padLeft(2, '0')}/"
          "${picked.year}";
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _priceController.dispose();
    _studentsController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _titleController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Course"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Course Thumbnail"),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: _image == null
                      ? const Center(child: Icon(Icons.image_outlined, size: 50))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),

              const Text("Course Title"),
              const SizedBox(height: 8),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),

              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Address"),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _addressController,
                          decoration:
                              const InputDecoration(border: OutlineInputBorder()),
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Required' : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Course Field"),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          decoration:
                              const InputDecoration(border: OutlineInputBorder()),
                          value: _selectedField,
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Required' : null,
                          items: const [
                            DropdownMenuItem(value: "Programming", child: Text("Programming")),
                            DropdownMenuItem(value: "Network", child: Text("Network")),
                            DropdownMenuItem(value: "Language", child: Text("Language")),
                            DropdownMenuItem(value: "Design", child: Text("Design")),
                            DropdownMenuItem(value: "Business", child: Text("Business")),
                            DropdownMenuItem(value: "AI", child: Text("AI")),
                            DropdownMenuItem(value: "Security", child: Text("Security")),
                            DropdownMenuItem(value: "Marketing", child: Text("Marketing")),
                            DropdownMenuItem(value: "Data", child: Text("Data")),
                            DropdownMenuItem(value: "Management", child: Text("Management")),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedField = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const Text("Course Suitable Level"),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedLevel,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: const [
                  DropdownMenuItem(value: "Beginner", child: Text("Beginner")),
                  DropdownMenuItem(value: "Intermediate", child: Text("Intermediate")),
                  DropdownMenuItem(value: "Advanced", child: Text("Advanced")),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedLevel = value;
                  });
                },
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),

              const SizedBox(height: 16),
              const Text("Course Description"),
              const SizedBox(height: 8),
              TextFormField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),

              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _startDateController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: "Start",
                        border: OutlineInputBorder(),
                      ),
                      onTap: () => _selectDate(context, _startDateController),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _endDateController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: "End",
                        border: OutlineInputBorder(),
                      ),
                      onTap: () => _selectDate(context, _endDateController),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Required' : null,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Course Price",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Required';
                        final num = int.tryParse(value);
                        if (num == null || num < 0) return 'Invalid price';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _studentsController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Maximum Students",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Required';
                        final num = int.tryParse(value);
                        if (num == null || num < 0) return 'Invalid number';
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Please select a course thumbnail")),
                        );
                        return;
                      }
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Course Submitted")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Add"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
