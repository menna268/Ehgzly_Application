import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/WorkSpace/spaces.dart';


Widget YourSpaces(Space space) {
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
              const SizedBox(height: 8),
              Center(
                child: Text(
                  space.status,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        space.status == 'Upcoming'
                            ? Color(0xff4CAF50)
                            : space.status == 'Ongoing'
                            ? Color(0xff2196F3)
                            : space.status == 'Completed'
                            ? Color(0xff9E9E9E)
                            : Colors.black, // اللون الافتراضي
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
