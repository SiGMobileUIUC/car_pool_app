// import 'package:flutter/material.dart';
// import 'ride.dart'; 
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:car_pool_app/screens/frontpage.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         backgroundColor: Colors.grey[200],
//         title: Text(
//           'UNIRide 🚘',
//           style: TextStyle(
//             fontSize: 50,
//             fontWeight: FontWeight.bold,
//             color: Color.fromARGB(255, 0, 0, 0),
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Welcome to UNIRide 🚘!',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Your Ride, Your Way.',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 0, 0, 0),
//                 fontSize: 20,
//                 fontStyle: FontStyle.italic,
//               ),
//             ),
//             SizedBox(height: 24),
//             Text(
//               'How to navigate the app:',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 12),
//             Text(
//               '1. Use the home page to answer any questions.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               '2. Tap on settings to update personal information.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               '3. Tap on ride to make a post as a driver or rider.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               '4. Tap on ride to view current postings.',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.directions_car), label: 'Ride'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings), label: 'Settings'),
//         ],
//         onTap: (int index) {
//           if (index == 1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => RidePage()),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:car_pool_app/screens/ride.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:car_pool_app/screens/frontpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.grey[200],
        title: Text(
          'UNIRide 🚘',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => signOut(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome to UNIRide 🚘!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your Ride, Your Way.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'How to navigate the app:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              '1. Use the home page to answer any questions.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '2. Tap on settings to update personal information.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '3. Tap on ride to make a post as a driver or rider.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '4. Tap on ride to view current postings.',
              style: TextStyle(fontSize: 16),
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
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (int index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RidePage()),
            );
          }
        },
      ),
    );
  }
}
