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
                const SizedBox(height: 16),
                FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      //TODO : format the dialog box to look better
                      //TODO : Validate that all entries are filled with correct data types before submitting post
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('New Post'),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                TextFormField(
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(20),
                                  ],
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a name';
                                    }
                                    if (isNumeric(value)) {
                                      return "Can't be a number";
                                    }
                                    if (value.length < 2) {
                                      return 'Must be more than 1 charater';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Name of the driver',
                                  ),
                                  onChanged: (value) {
                                    tempName = value;
                                    // Update the post value
                                    // You can store the value in a database or a state management solution
                                  },
                                ),
                                TextFormField(
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a car type';
                                    }
                                    if (isNumeric(value)) {
                                      return "Can't be a number";
                                    }
                                    if (value.length < 2) {
                                      return 'Must be more than 1 charater';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Car Type',
                                  ),
                                  onChanged: (value) {
                                    tempCarType = value;
                                    // Update the post value
                                    // You can store the value in a database or a state management solution
                                  },
                                ),
                                TextFormField(
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(30),
                                  ],
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a departure location';
                                    }
                                    if (value.length < 2) {
                                      return 'Must be more than 1 charater';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Departure',
                                  ),
                                  onChanged: (value) {
                                    if (value.length >= 2) {
                                      tempDeparture = value;
                                    }
                                    // Update the post value
                                    // You can store the value in a database or a state management solution
                                  },
                                ),
                                TextFormField(
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(30),
                                  ],
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a destination location';
                                    }

                                    if (value.length < 2) {
                                      return 'Must be more than 1 charater';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Destination',
                                  ),
                                  onChanged: (value) {
                                    if (value.length >= 2) {
                                      tempDestination = value;
                                    }
                                    // Update the post value
                                    // You can store the value in a database or a state management solution
                                  },
                                ),
                                TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(
                                        r'^(?:[01]?\d|2[0-3])(?::(?:[0-5]\d?)?)?$')),
                                    LengthLimitingTextInputFormatter(5),
                                  ],
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a time of departure';
                                    }
                                    if (isNumeric(value) ||
                                        value.contains(':')) {
                                    } else {
                                      return 'Must be a number or colon';
                                    }
                                    if (value.length != 5) {
                                      return 'Must be 5 charaters in 24hr format';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.datetime,
                                  decoration: const InputDecoration(
                                    hintText: 'Time',
                                  ),
                                  onChanged: (value) {
                                    if (value.length == 5 &&
                                        (isNumeric(value) ||
                                            value.contains(':'))) {
                                      tempTime = value;
                                    }

                                    // Update the post value
                                    // You can store the value in a database or a state management solution
                                  },
                                ),
                                TextFormField(
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(2),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an amount of available seats';
                                    }
                                    if (isNumeric(value)) {
                                      if (int.parse(value) < 1) {
                                        return 'Must be more than 0 seats';
                                      }
                                      if (int.parse(value) > 30) {
                                        return 'Must be less than 30 seats';
                                      }
                                    } else {
                                      return 'Must be a number';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: 'Available Seats',
                                  ),
                                  onChanged: (value) {
                                    if (value.isNotEmpty &&
                                        isNumeric(value) &&
                                        int.parse(value) >= 1 &&
                                        int.parse(value) <= 30) {
                                      tempAvailableSeats = int.parse(value);
                                    } else {
                                      tempAvailableSeats = 0;
                                    }
                                    // Update the post value
                                    // You can store the value in a database or a state management solution
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
                            TextButton(
                              onPressed: () {
                                // Check valid inputs
                                if (tempName.isNotEmpty &&
                                    tempCarType.isNotEmpty &&
                                    tempDeparture.isNotEmpty &&
                                    tempDestination.isNotEmpty &&
                                    tempTime.isNotEmpty &&
                                    tempAvailableSeats > 0) {
                                  // Add post if valid
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
                                  // Show an error message
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Error'),
                                        content: const Text(
                                            'Please fill all fields with valid values.'),
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
                  backgroundColor: (Colors.black),
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
