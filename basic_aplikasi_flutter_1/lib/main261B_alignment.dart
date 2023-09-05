import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// 2.6.1.B Container-alignment
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh Aligment")),
        body: Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            'Semangat Belajar',
            style: TextStyle(
              fontSize: 20,
            ),
          )
        )
      ),
    );
  }
}
