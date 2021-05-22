import 'package:flutter/material.dart';
import 'package:assignment/screens/create_profile.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task',
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      home: CreateProfile(),
    );
  }
}

