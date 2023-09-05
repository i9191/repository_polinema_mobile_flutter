import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// 2.5.4 Button
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton:FloatingActionButton(
          onPressed: (){},
        child: Icon(Icons.thumb_up),
        backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}
