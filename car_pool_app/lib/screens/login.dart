// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../screens/homepage.dart';
// import '../screens/signup.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage();

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController passwordController = TextEditingController();

//     Future<void> handleLogin() async {
//       try {
//         final String email = emailController.text.trim();
//         final String password = passwordController.text.trim();

//         // Authenticate the user using Firebase Authentication
//         final UserCredential userCredential =
//             await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );

//         // Check if the user's email is verified
//         final User user = userCredential.user!;
//         if (user.emailVerified) {
//           // Navigate to the main page or perform desired actions for a logged-in user
//         } else {
//           // Display a message indicating that the email is not verified
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Email not verified')),
//           );
//         }
//       } catch (e) {
//         // Handle login errors
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Login failed. Please try again.')),
//         );
//       }
//     }

//     void navigateToSignUpScreen() {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const SignupPage()), // Push SignUp route
//       );
//     }

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.grey[200], // Set the background color to a shade of gray
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.grey[200],
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.black,
//           ),
//         ),
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
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       "Login with your credentials.",
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 0, 0, 0),
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
//                       makeInput(label: "Email", controller: emailController),
//                       makeInput(
//                           label: "Password",
//                           obsureText: true,
//                           controller: passwordController),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 40),
//                   child: Container(
//                     padding: const EdgeInsets.only(top: 3, left: 3),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(40),
//                       border: const Border(
//                         bottom: BorderSide(color: Colors.black),
//                         top: BorderSide(color: Colors.black),
//                         right: BorderSide(color: Colors.black),
//                         left: BorderSide(color: Colors.black),
//                       ),
//                     ),
//                     child: MaterialButton(
//                       minWidth: double.infinity,
//                       height: 60,
//                       onPressed: handleLogin, // Modified onPressed callback
//                       color: Color.fromARGB(255, 0, 32, 91),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       child: const Text(
//                         "Login",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16,
//                           color: Colors.white70,
//                         ),
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
//                     Text("Don't have an account? "),
//                     GestureDetector(
//                       onTap: navigateToSignUpScreen, // Navigate to SignUp screen
//                       child: Text(
//                         "Sign Up",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 18,
//                           color: Color.fromARGB(255, 232, 74, 39),
//                         ),
//                       ),
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

// Widget makeInput(
//     {label, obsureText = false, required TextEditingController controller}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         label,
//         style: const TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.w400,
//           color: Colors.black87,
//         ),
//       ),
//       const SizedBox(
//         height: 5,
//       ),
//       TextField(
//         controller: controller,
//         obscureText: obsureText,
//         decoration: const InputDecoration(
//           contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(),
//           ),
//           border: OutlineInputBorder(),
//         ),
//       ),
//       const SizedBox(
//         height: 30,
//       ),
//     ],
//   );
// }

import 'package:car_pool_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Login to your account.",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            makeInput(
                              label: "Email",
                              controller: _emailController,
                            ),
                            makeInput(
                              label: "Password",
                              obscureText: true,
                              controller: _passwordController,
                            ),
                          ],
                        ),
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
                          onPressed: loginUser,
                          color: Color.fromARGB(255, 0, 32, 91),
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
                    //],
                    //),
                    //Column(
                    //children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignupPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color.fromARGB(255, 232, 74, 39),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInput({
    required String label,
    bool obscureText = false,
    required TextEditingController controller,
  }) {
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
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

  void loginUser() {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (_formKey.currentState!.validate()) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text(error.toString()),
              actions: [
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
    }
  }
}
