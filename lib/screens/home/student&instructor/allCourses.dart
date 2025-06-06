import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/student&instructor/enroll.dart';
import 'package:flutter_application_1/screens/home/student&instructor/home_ST-INS.dart';


Widget AllCourses(Course course, VoidCallback onFavoriteToggle,context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                course.imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: IconButton(
                    key: ValueKey(course.isFavorite),
                    icon: Icon(
                      course.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.black,
                    ),
                    onPressed: onFavoriteToggle,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 96, 8, 0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(course.instructorImageUrl),
                  ),
                  SizedBox(width: 3),
                  Expanded(
                    child: Text(
                      course.instructorname.length > 15
                          ? '${course.instructorname.substring(0, 14)}...'
                          : course.instructorname,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  course.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.favorite, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text('${course.likes}', style: TextStyle(color: Colors.grey)),
                  const Spacer(),
                  const Icon(Icons.people, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text('${course.students}', style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        'E£ ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFD700),
                        ),
                      ),
                      Text(
                        '${course.price.toInt()}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 60,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseDetailsPage(course: course,),
                        ),
                      );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
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
      ],
    ),
  );
}
