import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("MyApp"),
          backgroundColor: Color.fromARGB(255, 244, 66, 54),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // padding: EdgeInsets.all(10),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    elevation: 0,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text("BERITA TERBARU", textAlign: TextAlign.center),
                  ),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // padding: EdgeInsets.all(10),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    elevation: 0,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text("PERTANDINGAN HARI INI",
                        textAlign: TextAlign.center),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  margin: EdgeInsets.all(5),
                  color: Colors.purple,
                  alignment: Alignment.bottomLeft,
                  child: Text("Transfer",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5,right: 5),
                      height: 200,
                      width: double.infinity,
                      child: Image(
                        image: NetworkImage(
                            "https://img.etimg.com/thumb/msid-68985278,width-640,height-480,resizemode-75,imgsize-514948/diego-costa.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      // margin: EdgeInsets.all(5),
                      // width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Costa Mendekat Ke Palmeiras',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Card(
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                      'https://pixnio.com/free-images/2018/12/02/2018-12-02-19-17-12.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Apakah Alpaka sama seperti domba?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text('Nature',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                      'https://akcdn.detik.net.id/community/media/visual/2022/06/01/sayuran-pare-4_169.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Cegah Kanker hingga Turunkan Kolesterol',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text('Health',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
