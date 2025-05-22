import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/student&instructor/home_ST-INS.dart';


class CourseDetailsPage extends StatefulWidget {
  final Course course;

  static var enrolledCourses;

  const CourseDetailsPage({super.key, required this.course});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              //صورة المدرب
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
                      widget.course.imageUrl,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        widget.course.instructorImageUrl,
                      ),
                    ),
                    //اسم المدرب
                    title: Text(widget.course.instructorname),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 15),
            //معلومات الكورس
            Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(12),
              shadowColor: Colors.black.withOpacity(0.2),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //اسم وسعر الكورس
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.course.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                          'E£',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFFD700),
                          ),
                        ),
                            Text(
                              '${widget.course.price}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    //وصف الكورس
                    Text(
                      widget.course.description,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 12),
                    //مكان الكورس
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on, size: 18),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            widget.course.location,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    //تاريخ بداية الكورس
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          'Starts: ${widget.course.startDate}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    //تاريخ نهاية الكورس
                    Row(
                      children: [
                        const Icon(Icons.event, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          'Ends: ${widget.course.endDate}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Spacer(),
                //زر المفروووض يودي لصفحة الدفع
                Container(
                  width: 90,
                  height: 50,
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: ElevatedButton(
                    onPressed:(){

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                    ),
                    child: const Text(
                      'Enroll',
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
}
