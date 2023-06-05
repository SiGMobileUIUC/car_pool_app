import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 16),
            Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Name'),
              subtitle: Text('John Doe'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Handle edit name functionality
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('johndoe@example.com'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Handle edit email functionality
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Password'),
              subtitle: Text('********'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Handle edit password functionality
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Preferences',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Home Address'),
              subtitle: Text('123 Main St, City, State'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Handle edit home address functionality
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('Preferred Car Type'),
              subtitle: Text('Sedan'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Handle edit preferred car type functionality
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
