
import 'package:code_test/home.dart';
import 'package:flutter/material.dart';

late Size mq;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Coding Test",
      debugShowCheckedModeBanner: false,
      home: Home_Screen(),
    );
  }
}
