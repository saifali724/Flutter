import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'search_screen.dart'; // Import the SearchScreen

class ServicesScreen extends StatelessWidget {
  final List<String> services = [
    'Website Development',
    'Mobile Apps Development',
    'Social Media Marketing',
    'Cyber Security',
    'Graphic Designing',
    'Brand Strategy',
    'SEO Optimization',
    'Content Writing',
    'Video Editing',
    'E-commerce Solutions',
    'Cloud Services',
    'Data Analytics'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Increased height for the AppBar
        child: Padding(
          padding: EdgeInsets.only(top: 20.0), // Move the AppBar down
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
            ),
            title: Text(
              'Services',
              style: TextStyle(
                color: Color(0xFF0B8FAC), // New color for the title
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true, // Center the title
            actions: [
              IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(services: services),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0), // Space between the AppBar and the containers
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: services.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two containers per row
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 1.0, // Increase the size of the containers
                ),
                itemBuilder: (context, index) {
                  return _buildServiceItem(services[index]);
                },
              ),
            ),
          ),
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30.0), // Increased icon size
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time, size: 30.0), // Increased icon size
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message, size: 30.0), // Increased icon size
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30.0), // Increased icon size
                label: '',
              ),
            ],
            currentIndex: 1, // Set the index to the clock icon
            selectedItemColor: Color(0xFF0B8FAC), // New color
            unselectedItemColor: Colors.black,
            onTap: (index) {
              if (index == 0) {
                // Navigate to HomeScreen when Home icon is tapped
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
              // Handle other taps if needed
            },
            type: BottomNavigationBarType.fixed,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(String label) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFF0B8FAC), // New color
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0, // Larger text size
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
