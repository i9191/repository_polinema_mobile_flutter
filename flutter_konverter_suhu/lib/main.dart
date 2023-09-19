import 'package:flutter/material.dart';
import 'package:flutter_konverter_suhu/Result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konverter Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> listItem = ['Kelvin', 'Reamur', 'Fahrenheit'];

  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  final inputController = TextEditingController();
  String _newValue = 'Kelvin';
  double _result = 0;

  // Untuk list history tugas praktikum 2
  List<String> listViewItem = [];

  // fungsi hitung konversi
  void perhitunganSuhu() {
    _inputUser = double.parse(inputController.text);

    // jika input user tidak kosong
    if (_inputUser != null) {
      setState(() {
        switch (_newValue) {
          case 'Kelvin':
            _result = _inputUser - 273.15;
          case 'Reamur':
            _result = _inputUser / (4 / 5);
          case 'Fahrenheit':
            _result = (_inputUser - 32) * 5 / 9;
          default:
            _result = 0;
        }
        listViewItem.insert(0,
            '$_inputUser $_newValue = ${_result.toStringAsFixed(2)} Celsius');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konverter Suhu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: inputController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Masukkan suhu',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                DropdownButton<String>(
                  items: listItem.map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  value: _newValue,
                  onChanged: (String? changeValue) {
                    setState(() {
                      _newValue = changeValue!;
                      // tugas praktikum 1 ubah result saat dropdown ganti
                      perhitunganSuhu();
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // NEW
              ),
              onPressed: perhitunganSuhu,
              child: Text('Konversi Suhu'),
            ),
            // tampilkan result jika adda
            if (_result != null) Result(result: _result),

            // tugas praktikum 2 listView history
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 16),
              child: Container(
                child: Text(
                  "Histori Konversi: ",
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listViewItem.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listViewItem[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
