import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/student&instructor/allCourses.dart';
import 'package:flutter_application_1/screens/home/student&instructor/home_ST-INS.dart';

Widget buildFavFields(
  List<String> favFieldsList,
  List<Course> courses,
  void Function(Course) onFavoriteToggle,
) {
  return ListView.builder(
    itemCount: favFieldsList.length,
    itemBuilder: (context, index) {
      final field = favFieldsList[index];
      final relatedCourses =
          courses.where((course) => course.cate == field).toList();

      return ExpansionTile(
        title: Text(
          field,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        collapsedBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        iconColor: Colors.black,
        childrenPadding: EdgeInsets.zero,
        children: [
          relatedCourses.isNotEmpty
              ? GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.65,
                  children: relatedCourses.map((course) {
                    return AllCourses(
                      course,
                      () => onFavoriteToggle(course,),context
                    );
                  }).toList(),
                )
              : const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'No courses to show in this field',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
        ],
      );
    },
  );
}
