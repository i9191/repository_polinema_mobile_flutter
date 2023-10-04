import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/home2.dart';
import 'pages/item_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambahkan Item',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // home: home2(),
      initialRoute: '/',
      routes: {
        '/': (context) => home2(),
        '/home1': (context) => HomePage(),
        '/item': (context) => ItemPage(),
      },
    );
  }
}
