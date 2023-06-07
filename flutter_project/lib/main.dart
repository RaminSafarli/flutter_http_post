import 'package:flutter/material.dart';
import 'package:flutter_project/pages/Enterance.dart';
import 'package:flutter_project/pages/Register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(useMaterial3: true),
      home: Enterance(),
      // home: Login(),
      // home: Register(),
      debugShowCheckedModeBanner: false,
    );
  }
}
