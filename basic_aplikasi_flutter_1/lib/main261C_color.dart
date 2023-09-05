import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// 2.6.1.C Container-color
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh Color")),
        body: Container(
          margin: EdgeInsets.all(50),
          height: 200,
          width: 200,
          alignment: Alignment.center,
          color: Colors.amber[900],
          child: Text(
            'Semangat Belajar',
            style: TextStyle(fontSize: 20, color: Colors.white),
          )
        )
      ),
    );
  }
}
