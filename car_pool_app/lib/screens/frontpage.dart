import 'package:car_pool_app/screens/login.dart';
import 'package:car_pool_app/screens/signup.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          // color: Color.fromARGB(
          //     255, 175, 175, 175),
          color: Colors.grey[200], 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome To UNIRide!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Your Ride, Your Way.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        ),
                  ),
                ],
              ),
              const Text(
                "🚘",
                style: TextStyle(fontSize: 200),
              ),
              Column(
                children: [
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      // handle login button press
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    color: Color.fromARGB(255, 0, 32, 91),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      // handle sign up button press
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),
                        ),
                      );
                    },
                    color: Color.fromARGB(255, 232, 74, 39),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
