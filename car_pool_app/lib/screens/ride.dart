import 'package:car_pool_app/screens/account.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:car_pool_app/screens/frontpage.dart';
import 'homepage.dart';

class RidePage extends StatefulWidget {
  const RidePage({Key? key}) : super(key: key);
  @override
  State<RidePage> createState() => _RidePageState();
}

class _RidePageState extends State<RidePage> {
  int currentIndex = 1; // Added currentIndex variable

  List<String> postings = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.grey[200],
        title: const Text(
          'Ride',
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
                return ListTile(
                  title: Text(postings[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Make a New Post',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('New Post'),
                          content: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your post',
                            ),
                            onChanged: (value) {
                              // Update the post value
                              // You can store the value in a database or a state management solution
                            },
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
                                // Add the new post to the list
                                setState(() {
                                  postings.add('New Post');
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Post'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Create New Post'),
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

// CustomBottomNavigationBar implementation
class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
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
    );
  }
}
