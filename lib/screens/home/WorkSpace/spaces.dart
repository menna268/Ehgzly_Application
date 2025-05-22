class Space {
  final String workspacename;
  final String spaceimageUrl;
  final String workspaceImageUrl;
  final int capacity;
  final double priceperhour;
  final int spaceNumber;
  final String status;
  final int id;
  final List<String> selectedFeatures;


  Space({
    required this.workspacename,
    required this.spaceimageUrl,
    required this.workspaceImageUrl,
    required this.capacity,
    required this.priceperhour,
    required this.spaceNumber,
    required this.status,
    required this.id,
    required this.selectedFeatures,
  });
}
  final List<Space> _spaces = [
    Space(
      workspacename: 'John Carter',
      spaceimageUrl: 'assets/images/blobid1627218317141.jpg',
      workspaceImageUrl: 'assets/images/images.jpeg',
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
      spaceimageUrl: 'assets/images/blobid1627218317141.jpg',
      workspaceImageUrl: 'assets/images/images.jpeg',
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
      spaceimageUrl: 'assets/images/blobid1627218317141.jpg',
      workspaceImageUrl: 'assets/images/images.jpeg',
      capacity: 150,
      priceperhour: 1500,
      spaceNumber: 3000,
      status: 'Upcoming',
      id: 3,
      selectedFeatures: [
    'High-speed Internet (Wi-Fi)',
    'Display screens / Projector',
    'Air conditioning / Heating',
    'Ergonomic chairs for long work hours',
    'Individual or shared desks',
  ],
    ),
    Space(
      workspacename: 'John Elwan Ahmed',
      spaceimageUrl: 'assets/images/blobid1627218317141.jpg',
      workspaceImageUrl: 'assets/images/images.jpeg',
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
      spaceimageUrl: 'assets/images/blobid1627218317141.jpg',
      workspaceImageUrl: 'assets/images/images.jpeg',
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
