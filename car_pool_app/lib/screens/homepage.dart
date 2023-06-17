import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

// Import the necessary screens
//import 'package:car_pool_app/screens/frontpage.dart';
import 'package:car_pool_app/screens/account.dart';
import 'package:car_pool_app/screens/ride.dart';

import 'package:car_pool_app/CarpoolPostClass.dart';

class HomePage extends StatelessWidget {
  final List<CarPoolPost> carpoolPosts = [
    CarPoolPost(
      driverName: 'John Doe',
      carType: 'Sedan',
      departure: 'City A',
      destination: 'City B',
      time: '9:00 AM',
      availableSeats: 3,
    ),
    CarPoolPost(
      driverName: 'Sally Smith',
      carType: 'Coupe',
      departure: 'City C',
      destination: 'City D',
      time: '2:30 PM',
      availableSeats: 1,
    ),
    CarPoolPost(
      driverName: 'John Green',
      carType: 'SUV',
      departure: 'City E',
      destination: 'City F',
      time: '6:45 PM',
      availableSeats: 2,
    ),
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.grey[200],
        title: const Text(
          'UNIRide 🚘',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Carpooling Posts:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: carpoolPosts.length,
                itemBuilder: (context, index) {
                  final post = carpoolPosts[index];
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Carpooling Details'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Driver Name: ${post.driverName}'),
                                Text('Car Type: ${post.carType}'),
                                Text('Available Seats: ${post.availableSeats}'),
                                Text('Departure: ${post.departure}'),
                                Text('Destination: ${post.destination}'),
                                Text('Time: ${post.time}'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text('${post.departure} to ${post.destination}'),
                        subtitle: Text(
                            'Time: ${post.time}\nAvailable Seats: ${post.availableSeats}'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_car), label: 'Ride'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
        onTap: (int index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RidePage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccountScreen()),
            );
          }
        },
      ),
    );
  }
}
