import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// 2.6.1.E Container-margin
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh Margin")),
        body: Container(
          margin: EdgeInsets.all(50),
          height: 200,
          width: 200,
          alignment: Alignment.topLeft,
          color: Colors.blueGrey,
          child: Text(
            'Semangat Belajar Flutter',
            style:
                TextStyle(fontSize: 20, color: Colors.white),
          )
        )
      ),
    );
  }
}
