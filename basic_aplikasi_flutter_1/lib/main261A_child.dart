import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// 2.6.1.A Container-child
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Contoh Button")),
          body: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                ),
                onPressed: () {},
                child: Text("Button",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )
                ),
          ))),
    );
  }
}
