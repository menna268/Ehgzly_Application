import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back arrow
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              // Profile header
              Row(
                children: [
                  CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Amgd Emad"),
                      SizedBox(height: 8),
                      Text("Account Type", style: TextStyle(fontSize: 16)),
                      Text("Academy instructor"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Tabs
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: "WORK"),
                  Tab(text: "ABOUT"),
                  Tab(text: "Balance"),
                ],
              ),
              SizedBox(height: 10),
              // Tab content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // WORK Tab
                    Column(
                      children: [
                        buildInfoCard("30", "Number of courses"),
                        buildInfoCard("17", "Courses done"),
                        buildInfoCard("20", "Number of Certifications"),
                      ],
                    ),
                    // ABOUT Tab
                    ListView(
                      children: [
                        ListTile(
                          leading: Icon(Icons.email),
                          title: Text("Email"),
                          subtitle: Text("Amgd@gmail.com"),
                        ),
                        ListTile(
                          leading: Icon(Icons.web),
                          title: Text("Web"),
                          subtitle: Text("www.Amgd.com"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Skills", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Wrap(
                            spacing: 8,
                            children: [
                              Chip(label: Text("HTML")),
                              Chip(label: Text("CSS")),
                              Chip(label: Text("JAVASCRIPT")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("BIO", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Full-stack developer and coding mentor with a strong background in JavaScript, React, and Node.js.",
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/Editpro');
                            },
                            child: Text("Edit profile"),
                          ),
                        )
                      ],
                    ),
                    // BALANCE Tab
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.account_balance_wallet_outlined, size: 40),
                        SizedBox(height: 10),
                        Text("your balance", style: TextStyle(fontSize: 16)),
                        Text("00.00\$",
                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                        Text("Current balance"),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("To withdraw"),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12)),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(String number, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(number, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(label),
          ],
        ),
      ),
    );
  }
}
