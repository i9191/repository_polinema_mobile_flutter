import 'package:flutter/material.dart';

// import 'pages/home_page.dart';
import 'pages/home2.dart';
import 'pages/item_page.dart';

void main() {
  runApp(MyApp(
  // runApp(MaterialApp(
      // initialRoute: '/',
      // routes: {
      //   // '/': (context) => HomePage(),
      //   '/': (context) => home2(),
      //   '/item': (context) => ItemPage(),
      // },
      ));
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
      home: home2(),
    );
  }
}
