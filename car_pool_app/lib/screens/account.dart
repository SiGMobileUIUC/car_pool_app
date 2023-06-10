import 'package:car_pool_app/screens/frontpage.dart';
import 'package:car_pool_app/screens/homepage.dart';
import 'package:car_pool_app/screens/ride.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int currentIndex = 2; // Added currentIndex variable

  void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FrontPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable back button on the top left
        title: Text('Account'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () =>
                signOut(context), // Use the signOut method from HomePage
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    // You can display the user's profile image here
                    backgroundImage: AssetImage('assets/profile_image.png'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'johndoe@example.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Name'),
              subtitle: Text('John Doe'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle edit name functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('johndoe@example.com'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle edit email functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Password'),
              subtitle: Text('********'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle edit password functionality
              },
            ),
            SizedBox(height: 16),
            Divider(
              color: Colors.grey[400],
              thickness: 1,
              height: 0,
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Home Address'),
              subtitle: Text('123 Main St, City, State'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle edit home address functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('Preferred Car Type'),
              subtitle: Text('Sedan'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle edit preferred car type functionality
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });

          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RidePage()),
            );
          }
        },
      ),
    );
  }
}

// CustomBottomNavigationBar implementation
class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.directions_car), label: 'Ride'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: 'Account'),
      ],
      selectedItemColor: Colors.blue, // Change selected item color to blue
      //unselectedItemColor: Colors.grey,
    );
  }
}
