import 'package:flutter/material.dart';

class MySecondScreen extends StatefulWidget {
  const MySecondScreen({Key? key}) : super(key: key);

  @override
  State<MySecondScreen> createState() => _MySecondScreenState();
}

class _MySecondScreenState extends State<MySecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blueGrey,
      appBar: AppBar(
        title: const Text(' A N I M A T I O N S '),
      ),
      body: const Center(
        child: Text('This is Second Screen...'),
      ),
    );
  }
}
