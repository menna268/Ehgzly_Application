import 'package:flutter/material.dart';


class ReservationCard extends StatelessWidget {
  const ReservationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding:  EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow:  [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sara Hassan', // يمكن تغييره لاحقًا بالبيانات الفعلية
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.meeting_room, size: 18, color: Colors.grey),
              SizedBox(width: 5),
              Text('Space number: 1'),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.access_time, size: 18, color: Colors.grey),
              SizedBox(width: 5),
              Text('From 4:00 To 6:00'),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.date_range, size: 18, color: Colors.grey),
              SizedBox(width: 5),
              Text('20/6/2025'),
            ],
          ),
        ],
      ),
    );
  }
}
