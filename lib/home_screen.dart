import 'package:flutter/material.dart';
import 'package:other/authentication/firebase_auth_service.dart';
import 'services.dart'; // Import the ServicesScreen
import 'calendar.dart'; // Import the CalendarScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _showAllServices = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) { // Assuming clock icon is at index 1
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ServicesScreen()),
      );
    }
  }

  void _toggleShowAll() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ServicesScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80.0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 30.0,
              // backgroundImage: AssetImage('lib/profile_picture.png'),
            ),
            const SizedBox(width: 10.0),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Saif Ali',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.black,
              onPressed: () {
                // Define action for search button here
              },
              iconSize: 28.0,
            ),
            IconButton(
              icon: const Icon(Icons.logout_rounded),
              color: Colors.black,
              onPressed: () {
                FirebaseAuthService().signOut();
                // Define action for search button here
              },
              iconSize: 28.0,
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Services',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: _toggleShowAll,
                    child: const Text(
                      'see all',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF0B8FAC), // New color
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildServiceCard(label: 'Website Development'),
                  const SizedBox(width: 13.0),
                  _buildServiceCard(label: 'Mobile Apps Development'),
                  const SizedBox(width: 16.0),
                  _buildServiceCard(label: 'Social Media Marketing'),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0B8FAC), // New color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tech Consultation',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      const Text(
                        'Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('lib/tech_consultation_image.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildServiceCard(label: 'Cyber Security'),
                  const SizedBox(width: 13.0),
                  _buildServiceCard(label: 'Graphic Designing'),
                  const SizedBox(width: 16.0),
                  _buildServiceCard(label: 'Brand Strategy'),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'How can we assist you?',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ServicesScreen()),
                      );
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF0B8FAC), // New color
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildAssistanceCard(
              title: 'Do you want to improve your website?',
              description:
              'This file is totally free for education purpose, for commercial license please contact us.',
              buttonText: 'Book Appointment',
            ),
            _buildAssistanceCard(
              title: 'Want to market your business better?',
              description:
              'This file is totally free for education purpose, for commercial license please contact us.',
              buttonText: 'Book Appointment',
            ),
            _buildAssistanceCard(
              title: 'Have you thought about an aesthetic video for your business?',
              description:
              'This file is totally free for education purpose, for commercial license please contact us.',
              buttonText: 'Book Appointment',
            ),
            const SizedBox(height: 20.0), // Bottom padding
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF0B8FAC), // New color
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildServiceCard({required String label}) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF0B8FAC), // New color
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0, // Set text size here
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAssistanceCard({
    required String title,
    required String description,
    required String buttonText,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: double.infinity, // Makes the button full width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalendarScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B8FAC), // New color
                  padding: const EdgeInsets.symmetric(vertical: 14.0), // Increases button height
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 16.0, // Adjusts text size if needed
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
