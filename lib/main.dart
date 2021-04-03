import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/pages/auth/login.dart';
// import "package:firebase_core/firebase_core.dart"

void main() async {
  // WidgetsBinding().ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes",
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
        // scaffoldBackgroundColor: Colors.black87
      ),
      home: LoginPage(),
    );
  }
}
