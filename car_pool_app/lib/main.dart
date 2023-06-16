import 'package:car_pool_app/screens/homepage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../screens/frontpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Track sign in state.
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      if (kDebugMode) {
        print('User is currently signed out!');
      }
    } else {
      if (kDebugMode) {
        print('User is signed in!');
      }
    }
  });
  FirebaseAuth.instance.idTokenChanges().listen((User? user) {
    if (user == null) {
      if (kDebugMode) {
        print('User is currently signed out!');
      }
    } else {
      if (kDebugMode) {
        print('User is signed in!');
      }
    }
  });

  runApp(const CarpoolApp());
}

class CarpoolApp extends StatelessWidget {
  const CarpoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CARPOOL APP',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
