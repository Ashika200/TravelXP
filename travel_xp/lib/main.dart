import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_xp/login.dart';
import 'package:travel_xp/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDzn9BZXX_F9up4oHjK42fMA48RYLXyHLE",
      appId: "1:322870217901:android:5fdfc04cec50dcb0530a24",
      messagingSenderId: "322870217901",
      projectId: "1:322870217901:android:5fdfc04cec50dcb0530a24",
      storageBucket: "travel-xp-168c1.appspot.com",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/home': (context) => LoginPage(),
        '/profile': (context) => SignupPage(), // Add this line
      },
    );
  }
}
