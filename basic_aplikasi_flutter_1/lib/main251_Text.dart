import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// 2.5.1 Text Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Text(
        'This is Text Widget',
      ),
    );
  }
}