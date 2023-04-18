import 'package:car_pool_app/screens/login.dart';
import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       home: HomePage(),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hello There!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Welcome to UNIRide, please select one of the following:",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700], fontSize: 15),
                  ),
                ],
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height / 3,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage('assets/Illustration.png')),
              //   ),
              // ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  // handle login button press
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                color: Colors.indigoAccent[400],
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white70),
                ),
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  // handle sign up button press
                },
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
