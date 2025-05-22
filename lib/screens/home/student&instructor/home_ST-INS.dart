import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Catigory/catigory.dart';
import 'package:flutter_application_1/screens/Chat/chatscreen.dart';
import 'package:flutter_application_1/screens/Profile/profile.dart';
import 'package:flutter_application_1/screens/Widgets/side_menus/side_menu.dart';
import 'package:flutter_application_1/screens/home/WorkSpace/bottom_navigation.dart';
import 'package:flutter_application_1/screens/home/WorkSpace/spaces.dart';

import 'package:flutter_application_1/screens/home/student&instructor/YourCourses/addcourse.dart';
import 'package:flutter_application_1/screens/home/student&instructor/YourCourses/yourCourses.dart';
import 'package:flutter_application_1/screens/home/student&instructor/allCourses.dart';
import 'package:flutter_application_1/screens/home/student&instructor/enrolled.dart';
import 'package:flutter_application_1/screens/home/student&instructor/favFields.dart';
import 'package:flutter_application_1/screens/home/student&instructor/homeappbar.dart';
import 'package:flutter_application_1/screens/home/student&instructor/workspace_reserve.dart';

//المعلومات اللي محتاجاها لاي كورس
class Course {
  final String title;
  final String instructorname;
  final String imageUrl;
  final String instructorImageUrl;
  final int likes;
  final int students;
  final double price;
  final String cate;
  final String status;
  final int id;
  final String description;
  bool isFavorite;
  final String location;
  final String startDate;
  final String endDate;
  bool enrolled;

  Course({
    required this.title,
    required this.instructorname,
    required this.imageUrl,
    required this.instructorImageUrl,
    required this.likes,
    required this.students,
    required this.price,
    required this.cate,
    required this.status,
    required this.id,
    this.isFavorite = false,
    required this.description,
    required this.location,
    required this.startDate,
    required this.endDate,
    this.enrolled = false,
  });
}

//الحقول المفضلة اللي بيختارها وهو بيسجل في التطبيق
class Favfields {
  String firstFavFields = "Programming";
  String secFavFields = "Network";
  String thirdFavFields = "Language";
  List<String> get all => [firstFavFields, secFavFields, thirdFavFields];
}

class HomeSt_INS extends StatefulWidget {
  final String? email; //بحدد نوع ال account

  HomeSt_INS({this.email});

  @override
  _HomeSt_INSState createState() => _HomeSt_INSState();
}

class _HomeSt_INSState extends State<HomeSt_INS> {
  TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  void _onIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //التابات اللي فوق
  final List<String> _categories = [
    "All Courses",
    "Enrolled",
    "Favorite Fields",
    "Favorite Courses",
    "WorkSpaces",
    "Your Courses",
  ];
  void checkAndRemove() {
    if (widget.email == 'student@example.com') {
      _categories.remove("Your Courses");
    }
  }

  List<Space> filteredSpaces = [];
  int _selectedCategoryIndex = 0;
  //كورسات تجريبيه
  final List<Course> _courses = [
    Course(
      title: 'Flutter UI',
      instructorname: 'John Carter',
      imageUrl: 'asset/imges/blobid1627218317141.jpg',
      instructorImageUrl: 'asset/imges/images.jpg',
      likes: 879,
      students: 120,
      price: 3000,
      cate: 'Programming',
      status: 'Completed',
      id: 1,
      description:
          "🛰️ CCNA Course for Beginners is your practical entry point into the world of networking. You'll learn the basics of IP addressing, routers and switches, routing and switching concepts, and essential protocols like TCP/IP and DHCP. This course is perfect for anyone looking to start a career in IT or preparing for the CCNA certification, which can open strong opportunities in the job market once you master the fundamentals and apply them practically.",
      location: "Room A1 - Tech Center",
      startDate: "2025-06-01",
      endDate: "2025-06-30",
      enrolled: true,
    ),
    Course(
      title: 'C# Guide',
      instructorname: 'Nourhan Mahmoud',
      imageUrl: 'asset/imges/blobid1627218317141.jpg',
      instructorImageUrl: 'asset/imges/images.jpg',
      likes: 512,
      students: 95,
      price: 2700,
      cate: 'Programming',
      status: 'Completed',
      id: 2,
      description:
          "🛰️ CCNA Course for Beginners is your practical entry point into the world of networking. You'll learn the basics of IP addressing, routers and switches, routing and switching concepts, and essential protocols like TCP/IP and DHCP. This course is perfect for anyone looking to start a career in IT or preparing for the CCNA certification, which can open strong opportunities in the job market once you master the fundamentals and apply them practically.",
      location: "Room A1 - Tech Center",
      startDate: "2025-06-01",
      endDate: "2025-06-30",
      enrolled: false,
    ),
    Course(
      title: 'English',
      instructorname: 'Emma Watson',
      imageUrl: 'asset/imges/blobid1627218317141.jpg',
      instructorImageUrl: 'asset/imges/images.jpg',
      likes: 420,
      students: 150,
      price: 1500,
      cate: 'Language',
      status: 'Upcoming',
      id: 3,
      description:
          "🛰️ CCNA Course for Beginners is your practical entry point into the world of networking. You'll learn the basics of IP addressing, routers and switches, routing and switching concepts, and essential protocols like TCP/IP and DHCP. This course is perfect for anyone looking to start a career in IT or preparing for the CCNA certification, which can open strong opportunities in the job market once you master the fundamentals and apply them practically.",
      location: "Room A1 - Tech Center",
      startDate: "2025-06-01",
      endDate: "2025-06-30",
      enrolled: false,
    ),
    Course(
      title: 'CCNA',
      instructorname: 'John Elwan Ahmed',
      imageUrl: 'asset/imges/blobid1627218317141.jpg',
      instructorImageUrl: 'asset/imges/images.jpg',
      likes: 634,
      students: 110,
      price: 3500,
      cate: 'Network',
      status: 'Upcoming',
      id: 4,
      description:
          "🛰️ CCNA Course for Beginners is your practical entry point into the world of networking. You'll learn the basics of IP addressing, routers and switches, routing and switching concepts, and essential protocols like TCP/IP and DHCP. This course is perfect for anyone looking to start a career in IT or preparing for the CCNA certification, which can open strong opportunities in the job market once you master the fundamentals and apply them practically.",
      location: "Room A1 - Tech Center",
      startDate: "2025-06-01",
      endDate: "2025-06-30",
      enrolled: true,
    ),
    Course(
      title: 'CCNA',
      instructorname: 'Nourhan Mahmoud',
      imageUrl: 'asset/imges/blobid1627218317141.jpg',
      instructorImageUrl: 'asset/imges/images.jpg',
      likes: 634,
      students: 110,
      price: 3500,
      cate: 'Network',
      status: 'Ongoing',
      id: 2,
      description:
          "🛰️ CCNA Course for Beginners is your practical entry point into the world of networking. You'll learn the basics of IP addressing, routers and switches, routing and switching concepts, and essential protocols like TCP/IP and DHCP. This course is perfect for anyone looking to start a career in IT or preparing for the CCNA certification, which can open strong opportunities in the job market once you master the fundamentals and apply them practically.",
      location: "Room A1 - Tech Center",
      startDate: "2025-06-01",
      endDate: "2025-06-30",
      enrolled: false,
    ),
    Course(
      title: 'CCNA',
      instructorname: 'Nourhan Mahmoud',
      imageUrl: 'asset/imges/blobid1627218317141.jpg',
      instructorImageUrl: 'asset/imges/images.jpg',
      likes: 634,
      students: 110,
      price: 3500,
      cate: 'Network',
      status: 'Upcoming',
      id: 2,
      description:
          "🛰️ CCNA Course for Beginners is your practical entry point into the world of networking. You'll learn the basics of IP addressing, routers and switches, routing and switching concepts, and essential protocols like TCP/IP and DHCP. This course is perfect for anyone looking to start a career in IT or preparing for the CCNA certification, which can open strong opportunities in the job market once you master the fundamentals and apply them practically.",
      location: "Room A1 - Tech Center",
      startDate: "2025-06-01",
      endDate: "2025-06-30",
      enrolled: true,
    ),
    Course(
      title: 'CCNA',
      instructorname: 'John Elwan Ahmed',
      imageUrl: 'asset/imges/blobid1627218317141.jpg',
      instructorImageUrl: 'asset/imges/images.jpg',
      likes: 634,
      students: 110,
      price: 3500,
      cate: 'Network',
      status: 'Ongoing',
      id: 4,
      description:
          "🛰️ CCNA Course for Beginners is your practical entry point into the world of networking. You'll learn the basics of IP addressing, routers and switches, routing and switching concepts, and essential protocols like TCP/IP and DHCP. This course is perfect for anyone looking to start a career in IT or preparing for the CCNA certification, which can open strong opportunities in the job market once you master the fundamentals and apply them practically.",
      location: "Room A1 - Tech Center",
      startDate: "2025-06-01",
      endDate: "2025-06-30",
      enrolled: false,
    ),
    Course(
      title: 'Ai',
      instructorname: 'John Elwan Ahmed',
      imageUrl: 'asset/imges/blobid1627218317141.jpg',
      instructorImageUrl: 'asset/imges/images.jpg',
      likes: 634,
      students: 110,
      price: 3500,
      cate: 'Ai',
      status: 'Ongoing',
      id: 4,
      description:
          "🛰️ CCNA Course for Beginners is your practical entry point into the world of networking. You'll learn the basics of IP addressing, routers and switches, routing and switching concepts, and essential protocols like TCP/IP and DHCP. This course is perfect for anyone looking to start a career in IT or preparing for the CCNA certification, which can open strong opportunities in the job market once you master the fundamentals and apply them practically.",
      location: "Room A1 - Tech Center",
      startDate: "2025-06-01",
      endDate: "2025-06-30",
      enrolled: true,
    ),
  ];
  // اماكن تجريبيه
  final List<Space> _spaces = [
    Space(
      workspacename: 'John Carter',
      spaceimageUrl: 'asset/imges/blobid1627218317141.jpg',
      workspaceImageUrl: 'asset/imges/images.jpg',
      capacity: 120,
      priceperhour: 70,
      spaceNumber: 3000,
      status: 'Completed',
      id: 1,
      selectedFeatures: [
        'High-speed Internet (Wi-Fi)',
        'Display screens / Projector',
        'Air conditioning / Heating',
      ],
    ),
    Space(
      workspacename: 'Nourhan Mahmoud',
      spaceimageUrl: 'asset/imges/blobid1627218317141.jpg',
      workspaceImageUrl: 'asset/imges/images.jpg',
      capacity: 95,
      priceperhour: 100,
      spaceNumber: 3000,
      status: 'Completed',
      id: 2,
      selectedFeatures: [
        'High-speed Internet (Wi-Fi)',
        'Display screens / Projector',
        'Air conditioning / Heating',
      ],
    ),
    Space(
      workspacename: 'Emma Watson',
      spaceimageUrl: 'asset/imges/blobid1627218317141.jpg',
      workspaceImageUrl: 'asset/imges/images.jpg',
      capacity: 150,
      priceperhour: 150,
      spaceNumber: 3000,
      status: 'Upcoming',
      id: 3,
      selectedFeatures: [
        'High-speed Internet (Wi-Fi)',
        'Display screens / Projector',
        'Air conditioning / Heating',
        'Individual or shared desks',
        'Good natural lighting',
        'Quiet and distraction-free environment',
        'Personal lockers',
      ],
    ),
    Space(
      workspacename: 'John Elwan Ahmed',
      spaceimageUrl: 'asset/imges/blobid1627218317141.jpg',
      workspaceImageUrl: 'asset/imges/images.jpg',
      capacity: 110,
      priceperhour: 50,
      spaceNumber: 3000,
      status: 'Upcoming',
      id: 4,
      selectedFeatures: [
        'High-speed Internet (Wi-Fi)',
        'Display screens / Projector',
        'Air conditioning / Heating',
      ],
    ),
    Space(
      workspacename: 'Nourhan Mahmoud',
      spaceimageUrl: 'asset/imges/blobid1627218317141.jpg',
      workspaceImageUrl: 'asset/imges/images.jpg',
      capacity: 110,
      priceperhour: 100,
      spaceNumber: 3000,
      status: 'Ongoing',
      id: 2,
      selectedFeatures: [
        'High-speed Internet (Wi-Fi)',
        'Display screens / Projector',
        'Air conditioning / Heating',
      ],
    ),
  ];

  // فلترة الكورسات بناءا علي النص اللي مكتوب في حقل البحث و بناءا علي التاب اللي مختارها
  List<Course> getFilteredCourses(String searchText) {
    return _courses.where((course) {
      final matchesSearch = course.title.toLowerCase().contains(searchText);
      if (_categories[_selectedCategoryIndex] == "Favorite Courses") {
        return course.isFavorite && matchesSearch;
      } else if (_categories[_selectedCategoryIndex] == "Enrolled") {
        return course.enrolled && matchesSearch;
      } else if (_categories[_selectedCategoryIndex] == "Your Courses") {
        return course.title.toLowerCase().contains(searchText) && matchesSearch;
      } else {
        return matchesSearch;
      }
    }).toList();
  }

  // بناء "Your Courses"
  Widget buildYourCourses() {
    final yourCourses = _courses.where((course) => course.id == 2).toList();

    if (yourCourses.isEmpty) {
      return Center(
        child: Text(
          'You have not added any courses yet.',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 12,
      childAspectRatio: 0.70,
      children: yourCourses.map((course) {
        return YourCourses(course, () {
          setState(() {
            course.isFavorite = !course.isFavorite;
          });
        });
      }).toList(),
    );
  }

  // بناء "Your Courses"
  Widget buildEnrolledCourses() {
    final enrolledCourses =
        _courses.where((course) => course.enrolled == true).toList();

    if (enrolledCourses.isEmpty) {
      return Center(
        child: Text(
          'You have not added any courses yet.',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 12,
      childAspectRatio: 0.70,
      children: enrolledCourses.map((course) {
        return Enrolled(course, () {
          setState(() {
            course.isFavorite = !course.isFavorite;
          });
        });
      }).toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    checkAndRemove();
  }

  @override
  Widget build(BuildContext context) {
    final String searchText = _searchController.text.toLowerCase();
    List<Course> filteredCourses = getFilteredCourses(searchText);
    //فلترة الاماكن بناءا علي النص اللي في حقل البحث
    List<Space> getFilteredSpaces(String searchText) {
      return _spaces.where((space) {
        final matchesSearch = space.workspacename.toLowerCase().contains(
              searchText,
            );
        return matchesSearch;
      }).toList();
    }

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    List<Space> filteredSpaces = getFilteredSpaces(searchText);

    return Scaffold(
      key: _scaffoldKey,
      appBar: buildCustomAppBar(
        onMenuPressed: () {
          _scaffoldKey.currentState?.openEndDrawer();
        },
      ),
      backgroundColor: Color(0XFFF4F4F4),
      endDrawer: SideMenu(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            //التابات اللي فوق حقل البحث
            SizedBox(
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final isSelected = index == _selectedCategoryIndex;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color:
                                isSelected ? Colors.black : Colors.grey[400]!,
                          ),
                        ),
                        child: Text(
                          _categories[index],
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.grey[800],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            //حقل البحث
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 15,
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear, color: Colors.black),
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                            });
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Builder(
                  builder: (context) {
                    final selectedCategory =
                        _categories[_selectedCategoryIndex];
                    List<Course> coursesToShow = [];
                    //بحدد المحتوي اللي هيظهر بناءا علي التاب اللي مختاراها
                    if (selectedCategory == "All Courses") {
                      coursesToShow = filteredCourses;
                    } else if (selectedCategory == "WorkSpaces") {
                      return GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.65,
                        children: filteredSpaces
                            .map((space) => WorkSpace(context, space))
                            .toList(),
                      );
                    } else if (selectedCategory == "Favorite Courses") {
                      coursesToShow = filteredCourses
                          .where((course) => course.isFavorite)
                          .toList();
                    } else if (selectedCategory == "Enrolled") {
                      return Expanded(
                          child: Center(child: buildEnrolledCourses()));
                    } else if (selectedCategory == "Favorite Fields") {
                      final favFieldsList = Favfields().all;
                      return buildFavFields(favFieldsList, _courses, (
                        Course course,
                      ) {
                        setState(() {
                          course.isFavorite = !course.isFavorite;
                        });
                      });
                    } else if (selectedCategory == "Your Courses") {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //زر اضافة كورس
                          Container(
                            width: 90,
                            height: 50,
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddCourse(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                              ),
                              child: const Text(
                                'Add',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          //الكورسات اللي انت ضايفها
                          Expanded(child: Center(child: buildYourCourses())),
                        ],
                      );
                    }
                    //في حاله مفيش كورسات انت ضايفها
                    if (coursesToShow.isEmpty) {
                      return Center(
                        child: Text(
                          'No courses to show in this category.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }

                    return GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.65,
                      children: coursesToShow.map((course) {
                        return AllCourses(course, () {
                          setState(() {
                            course.isFavorite = !course.isFavorite;
                          });
                        }, context);
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
