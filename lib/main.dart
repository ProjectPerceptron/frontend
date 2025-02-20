import 'package:flutter/material.dart';
import 'package:perceptron/features/login/login_screen.dart';
import 'package:perceptron/features/student/dashboard_screen.dart';
import 'package:perceptron/features/student/student_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perceptron',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/login" : (_) => const LoginPage(),
        "/student_screen": (_)=> MainScreen()
      },
      initialRoute: "/student_screen",
    );
  }
}
