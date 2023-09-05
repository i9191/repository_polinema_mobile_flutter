import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// 2.5.2 Image Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Image(image: NetworkImage("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg")),
    );
  }
}
