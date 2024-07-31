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
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase project",
      debugShowCheckedModeBanner: false,
      initialRoute: "login",
      routes: {
        '/': (context) => const Home(),
        'login': (context) => const Login(),
        'signUp': (context) => const SignUp(),
      },
    );
  }
}
