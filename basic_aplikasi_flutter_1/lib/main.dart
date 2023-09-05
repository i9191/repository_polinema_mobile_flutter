import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // merge 2.5.1 - 2.5.7
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gabungan basic flutter 2.5.1 - 2.5.7'),
        ),
        body: Center(
          child: Text('Ini adalah gabungan basic flutter 2.5.1 - 2.5.7'),
        ),
        
        bottomNavigationBar: BottomAppBar(
          child: Container(height: 50.0,),
        ),
      ),
    );
  }
}

// MyHomePage untuk Date and Time Pickers 2.5.8
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;
  
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // Variable/State untuk mengambil tanggal
//   DateTime selectedDate = DateTime.now();

//   // Initial SelectDate FLutter
//   Future<Null> _selectDate(BuildContext context) async {
//     // Initial DateTime FIinal Picked
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2015, 8),
//       lastDate: DateTime(2101)
//     );
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;
//       });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text("${selectedDate.toLocal()}".split(' ')[0]),
//             SizedBox(height: 20.0,),
//             ElevatedButton(
//               onPressed: () => {
//                 _selectDate(context),
//                 print(selectedDate.day + selectedDate.month + selectedDate.year )
//               },

//               child: Text('Pilih Tanggal'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// MyLayout untuk Dialog 2.5.6
class MyLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text('Show alert'),
        onPressed: (){
          showAlertDialog(context);
        }
      ),
    );
  }
}

// function untuk Dialog 2.5.6 
showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



