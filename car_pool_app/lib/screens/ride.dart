// import 'package:flutter/material.dart';

// class RidePage extends StatefulWidget {
//   @override
//   _RidePageState createState() => _RidePageState();
// }

// class _RidePageState extends State<RidePage> {
//   List<String> postings = [];

//   int _currentIndex = 1; // Current index for the bottom navigation bar

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ride'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: postings.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(postings[index]),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Text(
//                   'Make a New Post',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: Text('New Post'),
//                           content: TextField(
//                             decoration: InputDecoration(
//                               hintText: 'Enter your post',
//                             ),
//                             onChanged: (value) {
//                               // Update the post value
//                               // You can store the value in a database or a state management solution
//                             },
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               child: Text('Cancel'),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 // Add the new post to the list
//                                 setState(() {
//                                   postings.add('New Post');
//                                 });
//                                 Navigator.pop(context);
//                               },
//                               child: Text('Post'),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   child: Text('Create New Post'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.directions_car), label: 'Ride'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings), label: 'Settings'),
//         ],
//         onTap: (int index) {
//           if (index == 0) {
//             Navigator.popUntil(context, ModalRoute.withName('/'));
//           } else if (index == 2) {
//             // Handle settings navigation
//             // You can replace this with your desired logic for the Settings page
//             Navigator.pushNamed(context, '/settings');
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:car_pool_app/screens/account.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class RidePage extends StatefulWidget {
  @override
  _RidePageState createState() => _RidePageState();
}

class _RidePageState extends State<RidePage> {
  List<String> postings = [];

  int _currentIndex = 1; // Current index for the bottom navigation bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ride'),
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
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Make a New Post',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('New Post'),
                          content: TextField(
                            decoration: InputDecoration(
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
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Add the new post to the list
                                setState(() {
                                  postings.add('New Post');
                                });
                                Navigator.pop(context);
                              },
                              child: Text('Post'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Create New Post'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_car), label: 'Ride'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountScreen()),
            );
          }
        },
      ),
    );
  }
}
