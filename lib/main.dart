// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/App/auth/signup.dart';
import 'package:firebase_project/App/home.dart';
import 'package:firebase_project/App/auth/login.dart';
import 'package:firebase_project/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('====================================User is currently signed out!');
    } else {
      print('====================================User is signed in!');
    }
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase project",
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? const Login() : const Home(),
      routes: {
        'homepage': (context) => const Home(),
        'login': (context) => const Login(),
        'signUp': (context) => const SignUp(),
      },
    );
  }
}
