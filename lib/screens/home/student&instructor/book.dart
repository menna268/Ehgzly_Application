import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/home/WorkSpace/spaces.dart';


class WorkspaceDetailsPage extends StatefulWidget {
  final Space space;

  const WorkspaceDetailsPage({super.key, required this.space});

  @override
  State<WorkspaceDetailsPage> createState() => _WorkspaceDetailsPageState();
}

class _WorkspaceDetailsPageState extends State<WorkspaceDetailsPage> {
  TimeOfDay? _fromTime;
  TimeOfDay? _toTime;
  DateTime? _selectedDate;
  double? _hourlyRate;

  @override
  void initState() {
    super.initState();
    _hourlyRate = widget.space.priceperhour.toDouble();
  }

  int _calculatedPrice = 0;
  final TextEditingController _dateController = TextEditingController();
  void _updatePrice() {
    if (_fromTime != null && _toTime != null) {
      final fromMinutes = _fromTime!.hour * 60 + _fromTime!.minute;
      final toMinutes = _toTime!.hour * 60 + _toTime!.minute;

      if (toMinutes > fromMinutes) {
        final diffMinutes = toMinutes - fromMinutes;
        final pricePerMinute = _hourlyRate! / 60;
        final totalPrice = (diffMinutes * pricePerMinute).round();

        setState(() {
          _calculatedPrice = totalPrice;
        });
      } else {
        setState(() {
          _calculatedPrice = 0;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a valid time range')),
        );
      }
    }
  }

  Future<void> _pickTime(bool isFrom) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          _fromTime = picked;
        } else {
          _toTime = picked;
        }
      });
      _updatePrice();
    }
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _formatDate(picked); // تحديث الكنترولر
      });
    }
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return '00';
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return TimeOfDay.fromDateTime(dt).format(context);
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'dd/mm/yyyy';
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(''), leading: const BackButton()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and Profile
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      widget.space.spaceimageUrl,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        widget.space.workspaceImageUrl,
                      ),
                    ),

                    title: Text(widget.space.workspacename),

                    subtitle: const Text("address from user info"),
                  ),
                ],
              ),
            ),

            // Capacity and Space Number
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(label: Text('🧍 Capacity: ${widget.space.capacity}')),
                Chip(
                  label: Text('🏷️ Space Number: ${widget.space.spaceNumber}'),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Features and Amenities
            const Text(
              'Workspace Features & Amenities',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            _buildFeatureSection('Technology', [
              'High-speed Internet (Wi-Fi)',
              'Display screens / Projector',
              'Power outlets everywhere',
              'Speakers / Sound system',
              'Printer / Scanner',
              'Air conditioning / Heating',
            ]),
            _buildFeatureSection('Comfort & Setup', [
              'Ergonomic chairs for long work hours',
              'Individual or shared desks',
              'Good natural lighting',
              'Quiet and distraction-free environment',
            ]),
            _buildFeatureSection('Security & Organization', [
              'Safe for personal belongings',
              'Security cameras',
              'Access with code or magnetic card',
              'Personal lockers',
            ]),

            const SizedBox(height: 12),

            // Time and Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Time',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'E£$_calculatedPrice',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            //بحدد الوقت اللي محتاجة فيه المكان من الساعة كام لكام
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickTime(true),
                    child: _buildTimePicker(
                      label: 'From',
                      time: _formatTime(_fromTime),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickTime(false),
                    child: _buildTimePicker(
                      label: 'To',
                      time: _formatTime(_toTime),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _pickDate,
              child: AbsorbPointer(
                // يمنع الكتابة اليدوية
                child: TextField(
                  readOnly: true,
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: 'Date',
                    hintText: 'dd/mm/yyyy',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            //زر يوديني علي صفحة الدفع
            Row(
              children: [
                Spacer(),
                Container(
                  width: 90,
                  height: 50,
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                    ),
                    child: const Text(
                      'Book',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
//دي ويدجت بتعرض المميزات اللي الموجوده في المكان ده المفروض انها بتعرضها بناءا علي اللي المكان محدده
  Widget _buildFeatureSection(String title, List<String> allItems) {
    // فلترة المميزات المختارة فقط
    final selectedItems =
        allItems
            .where((item) => widget.space.selectedFeatures.contains(item))
            .toList();

    // لو مفيش أي مميزات مختارة في هذا القسم، ميعرضش الكارد
    if (selectedItems.isEmpty) return const SizedBox.shrink();

    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "📌 $title",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            ...selectedItems.map(
              (item) => Row(
                children: [
                  const Icon(Icons.check, size: 18, color: Colors.green),
                  const SizedBox(width: 6),
                  Expanded(child: Text(item)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimePicker({required String label, required String time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(time),
        ),
      ],
    );
  }
}
