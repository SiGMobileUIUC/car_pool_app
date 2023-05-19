// import 'package:car_pool_app/screens/signup.dart';
// import 'package:flutter/material.dart';
// //import 'HomePage.dart';

// class LoginDemo extends StatefulWidget {
//   @override
//   _LoginDemoState createState() => _LoginDemoState();
// }

// class _LoginDemoState extends State<LoginDemo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Login Page"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             // Padding(
//             //   padding: const EdgeInsets.only(top: 60.0),
//             //   child: Center(
//             //     child: Container(
//             //         width: 200,
//             //         height: 150,
//             //         /*decoration: BoxDecoration(
//             //             color: Colors.red,
//             //             borderRadius: BorderRadius.circular(50.0)),*/
//             //         child: Image.asset('asset/images/flutter-logo.png')),
//             //   ),
//             // ),
//             Padding(
//               //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Email',
//                     hintText:
//                         'Enter valid UIUC email id as netid@illinois.edu'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 15.0, right: 15.0, top: 15, bottom: 0),
//               //padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Password',
//                     hintText: 'Enter UIUC UIN'),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//               },
//               child: Text(
//                 'Forgot Password',
//                 style: TextStyle(color: Colors.blue, fontSize: 15),
//               ),
//             ),
//             Container(
//               height: 50,
//               width: 250,
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Navigator.push(
//                   //context, MaterialPageRoute(builder: (_) => SecondRoute()));
//                 },
//                 child: Text(
//                   'Login',
//                   style: TextStyle(color: Colors.white, fontSize: 25),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 130,
//             ),
//             TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SignupPage(),
//                     ),
//                   );
//                 },
//                 child: const Text('New User? Create Account'))
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../screens/homepage.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               size: 20,
//               color: Colors.black,
//             )),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               children: [
//                 Column(
//                   children: [
//                     const Text(
//                       "Login",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       "Welcome back ! Login with your credentials",
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.grey[700],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     )
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 40),
//                   child: Column(
//                     children: [
//                       makeInput(label: "Email"),
//                       makeInput(label: "Password", obsureText: true),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 40),
//                   child: Container(
//                     padding: const EdgeInsets.only(top: 3, left: 3),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(40),
//                         border: const Border(
//                             bottom: BorderSide(color: Colors.black),
//                             top: BorderSide(color: Colors.black),
//                             right: BorderSide(color: Colors.black),
//                             left: BorderSide(color: Colors.black))),
//                     child: MaterialButton(
//                       minWidth: double.infinity,
//                       height: 60,
//                       onPressed: () {},
//                       color: Colors.indigoAccent[400],
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(40)),
//                       child: const Text(
//                         "Login",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16,
//                             color: Colors.white70),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Dont have an account?"),
//                     Text(
//                       "Sign Up",
//                       style:
//                           TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget makeInput({label, obsureText = false}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         label,
//         style: const TextStyle(
//             fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
//       ),
//       const SizedBox(
//         height: 5,
//       ),
//       TextField(
//         obscureText: obsureText,
//         decoration: const InputDecoration(
//           contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 //color: Colors.grey[400],
//                 ),
//           ),
//           border: OutlineInputBorder(
//               //borderSide: BorderSide(color: Colors.grey[400])
//               ),
//         ),
//       ),
//       const SizedBox(
//         height: 30,
//       )
//     ],
//   );
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    Future<void> handleLogin() async {
      try {
        final String email = emailController.text.trim();
        final String password = passwordController.text.trim();

        // Authenticate the user using Firebase Authentication
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Check if the user's email is verified
        final User user = userCredential.user!;
        if (user.emailVerified) {
          // Navigate to the main page or perform desired actions for a logged-in user
        } else {
          // Display a message indicating that the email is not verified
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email not verified')),
          );
        }
      } catch (e) {
        // Handle login errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Welcome back! Login with your credentials",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      makeInput(label: "Email", controller: emailController),
                      makeInput(
                          label: "Password",
                          obsureText: true,
                          controller: passwordController),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: const Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: handleLogin, // Modified onPressed callback
                      color: Colors.indigoAccent[400],
                      shape: RoundedRectangleBorder(
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
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget makeInput(
    {label, obsureText = false, required TextEditingController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        controller: controller,
        obscureText: obsureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
    ],
  );
}
