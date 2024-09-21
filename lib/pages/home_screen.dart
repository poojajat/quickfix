import 'package:flutter/material.dart';
import 'package:flutter_app/pages/profile_page.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// Import the Electrician screen
import 'electrician.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 3) {
      // Navigate to the Profile page if Profile icon is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Ensures content adjusts when keyboard is opened
      // appBar: AppBar(
      //   title: Text('Home'),
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          // Wraps the content to prevent RenderFlex overflow when keyboard appears
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/logo.png', // Path to your app logo
                      height: 40, // Set height for the logo
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        // Add notification action here
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.zero,
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search here..',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20), // Add space between search bar and text
                Text(
                  'What are you looking for?',
                  style: TextStyle(
                    fontSize: 25, // Big text size
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      children: [
                        // Wrapping the Electrician card with GestureDetector for navigation
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to ElectricianScreen when card is tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Electrician()),
                              );
                            },
                            child: buildServiceCard('Electrician', 'assets/images/image_3.png'),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(child: buildServiceCard('AC Repair', 'assets/images/image_1.png')),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: buildServiceCard('Plumber', 'assets/images/image.png')),
                        SizedBox(width: 10),
                        Expanded(child: buildServiceCard('Carpenter', 'assets/images/image_2.png')),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: buildServiceCard('Home Cleaning', 'assets/images/image_4.png')),
                        SizedBox(width: 10),
                        Expanded(child: buildServiceCard('Painter', 'assets/images/image_5.png')),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildServiceCard(String serviceName, String imagePath) {
    return Container(
      height: 100, // Set a fixed height for the card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(
          serviceName,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


