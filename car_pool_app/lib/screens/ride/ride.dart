import 'package:car_pool_app/screens/account/account.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:car_pool_app/screens/frontpage.dart';
import '../homepage.dart';
import 'package:car_pool_app/CarpoolPostClass.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:car_pool_app/screens/ride/ride_functions.dart';
import 'package:flutter/services.dart';

class RidePage extends StatefulWidget {
  const RidePage({Key? key}) : super(key: key);
  @override
  State<RidePage> createState() => _RidePageState();
}

class _RidePageState extends State<RidePage> {
  
  int currentIndex = 1; // Added currentIndex variable
  CarPoolPost postDescription = CarPoolPost(
    driverName: 'Loading...',
    carType: 'Loading...',
    departure: 'Loading...',
    destination: 'Loading...',
    time: 'Loading...',
    availableSeats: 0,
  );
  String tempName = "";
  String tempCarType = "";
  String tempDeparture = "";
  String tempDestination = "";
  String tempTime = "";
  int tempAvailableSeats = 0;

  //TODO : Need to create dynamic lists of on the current user's carpool posts that we store on firebase and maybe pull every min or so or when user refereshes page
  List<CarPoolPost> postings = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.grey[200],
        title: const Text(
          'Ride 🚗',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: postings.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                        '${postings[index].departure} to ${postings[index].destination}'),
                    subtitle: Text(
                      'Time: ${postings[index].time}\nAvailable Seats: ${postings[index].availableSeats}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            'Car Type: ${postings[index].carType}\nDriver: ${postings[index].driverName}'),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            size: 15,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // Show a confirmation message
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Delete Post'),
                                  content: const Text(
                                      'Are you sure you want to delete this post?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // Close confirmation message
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          // Remove the post
                                          postings.removeAt(index);
                                        });
                                        Navigator.pop(
                                            context); // Close confirmation message
                                      },
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Make A Post!'),
                          content: Form(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  onChanged: (value) {
                                    tempName = value;
                                  },
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Car Type',
                                    prefixIcon: Icon(Icons.directions_car),
                                  ),
                                  onChanged: (value) {
                                    tempCarType = value;
                                  },
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Departure',
                                    prefixIcon: Icon(Icons.location_on),
                                  ),
                                  onChanged: (value) {
                                    tempDeparture = value;
                                  },
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Destination',
                                    prefixIcon: Icon(Icons.location_on),
                                  ),
                                  onChanged: (value) {
                                    tempDestination = value;
                                  },
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    labelText: 'Time',
                                    prefixIcon: Icon(Icons.access_time),
                                  ),
                                  onChanged: (value) {
                                    tempTime = value;
                                  },
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Available Seats',
                                    prefixIcon: Icon(Icons.event_seat),
                                  ),
                                  onChanged: (value) {
                                    tempAvailableSeats = int.tryParse(value) ?? 0;
                                  },
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (tempName.isNotEmpty &&
                                    tempCarType.isNotEmpty &&
                                    tempDeparture.isNotEmpty &&
                                    tempDestination.isNotEmpty &&
                                    tempTime.isNotEmpty &&
                                    tempAvailableSeats > 0) {
                                  setState(() {
                                    postDescription = CarPoolPost(
                                      driverName: tempName,
                                      carType: tempCarType,
                                      departure: tempDeparture,
                                      destination: tempDestination,
                                      time: tempTime,
                                      availableSeats: tempAvailableSeats,
                                    );
                                    postings.add(postDescription);
                                  });
                                  Navigator.pop(context);
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Error'),
                                        content: const Text(
                                          'Please fill all fields with valid values.',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              child: const Text('Post'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  backgroundColor: Colors.black,
                  child: const Icon(Icons.add, size: 50),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });

          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
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

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.black,
      //unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car),
          label: 'Ride',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
      ],
    );
  }
}
