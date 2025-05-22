import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Widgets/side_menus/side_menu%20work.dart';
import 'package:flutter_application_1/screens/home/WorkSpace/Reservations.dart';
import 'package:flutter_application_1/screens/home/WorkSpace/add_space.dart';
import 'package:flutter_application_1/screens/home/WorkSpace/spaces.dart';
import 'package:flutter_application_1/screens/home/WorkSpace/yourspace.dart';
import 'package:flutter_application_1/screens/home/student&instructor/YourCourses/addcourse.dart';
import 'package:flutter_application_1/screens/home/student&instructor/homeappbar.dart';
import 'package:flutter_application_1/screens/home/student&instructor/workspace_reserve.dart';

class Home_workspace extends StatefulWidget {
  @override
  _Home_workspaceState createState() => _Home_workspaceState();
}

class _Home_workspaceState extends State<Home_workspace> {
  TextEditingController _searchController = TextEditingController();
  final List<String> _categories = ["Your Spaces", "Reservations"];

  int _selectedCategoryIndex = 0;

  final List<Space> _spaces = [
    Space(
      workspacename: 'John Carter',
      spaceimageUrl: 'asset/imges/blobid1627218317141.jpg',
      workspaceImageUrl: 'asset/imges/images.jpg',
      capacity: 120,
      priceperhour: 3000,
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
      priceperhour: 2700,
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
      priceperhour: 1500,
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
        'Access with code or magnetic card',
        'Personal lockers',
      ],
    ),
    Space(
      workspacename: 'John Elwan Ahmed',
      spaceimageUrl: 'asset/imges/blobid1627218317141.jpg',
      workspaceImageUrl: 'asset/imges/images.jpg',
      capacity: 110,
      priceperhour: 3500,
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
      priceperhour: 3500,
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

  Widget buildYourSpaces() {
    final yourSpaces = _spaces.where((space) => space.id == 2).toList();

    if (yourSpaces.isEmpty) {
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
      children: yourSpaces.map((space) {
        return YourSpaces(space);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String searchText = _searchController.text.toLowerCase();

    List<Space> filteredCourses = _spaces.where((space) {
      final matchesSearch =
          space.spaceNumber.toString().toLowerCase().contains(searchText);
      return matchesSearch;
    }).toList();
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: buildCustomAppBar(
        onMenuPressed: () {
          _scaffoldKey.currentState?.openEndDrawer();
        },
      ),
      backgroundColor: Color(0XFFF4F4F4),
      endDrawer: SideMenu_work(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
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

                    List<Space> coursesToShow = [];

                    if (selectedCategory == "All Courses") {
                      coursesToShow = _spaces.where((course) {
                        return course.spaceNumber
                            .toString()
                            .toLowerCase()
                            .contains(_searchController.text.toLowerCase());
                      }).toList();
                    } else if (selectedCategory == "Enrolled") {
                      coursesToShow = _spaces
                          .where(
                            (course) =>
                                course.spaceNumber.toString().contains('C#'),
                          )
                          .toList();
                    } else if (selectedCategory == "Your Spaces") {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 90,
                            height: 50,
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AddSpaceScreen(),
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
                          Expanded(child: Center(child: buildYourSpaces())),
                        ],
                      );
                    } else if (selectedCategory == "Reservations") {
                      return ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const ReservationCard();
                        },
                      );
                    }

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
                      children: coursesToShow.map((space) {
                        return WorkSpace(context, space);
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
