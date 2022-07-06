
import 'package:animations_demo/AnimationScreen.dart';
import 'package:animations_demo/Shared%20axis/shared_axis_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SharedAxisDemo(),
    );
  }
}