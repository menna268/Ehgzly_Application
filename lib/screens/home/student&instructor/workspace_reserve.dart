import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/WorkSpace/spaces.dart';
import 'package:flutter_application_1/screens/home/student&instructor/book.dart';
import 'package:path/path.dart';

Widget WorkSpace(BuildContext context, Space space) {
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
                space.spaceimageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 96, 8, 0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(space.workspaceImageUrl),
                  ),
                  SizedBox(width: 3),
                  Expanded(
                    child: Text(
                      space.workspacename.length > 15
                          ? '${space.workspacename.substring(0, 14)}...'
                          : space.workspacename,
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
                  "Space Number:  ${space.spaceNumber}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.groups),
                    Text(
                      "Capacity:  ${space.capacity}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
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
                        '${space.priceperhour.toInt()}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "/hr",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: 60,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => WorkspaceDetailsPage(space: space),
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
      ],
    ),
  );
}
