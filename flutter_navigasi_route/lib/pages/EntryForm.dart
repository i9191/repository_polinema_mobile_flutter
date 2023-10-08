import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_navigasi_route/models/item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class EntryForm extends StatefulWidget {
  final Item item;
  EntryForm(this.item);
  @override
  EntryFormState createState() => EntryFormState(this.item);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Item item;
  EntryFormState(this.item);
  TextEditingController kodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController imgController = TextEditingController();
  File? imgnya,imgTemp;
  String? itemImgName;
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    //kondisi
    if (item.id != 0) {
      imgnya = File("/data/user/0/com.example.flutter_navigasi_route/app_flutter/${item.img}");
      kodeController.text = item.kode!;
      nameController.text = item.name!;
      unitController.text = item.unit!;
      priceController.text = item.price!.toString();
      stokController.text = item.stok!.toString();
      imgController.text = item.img!;
    }else{
      item.id = null;
      imgController.text = 'default.jpg';
    }
    //rubah
    return Scaffold(
      appBar: AppBar(
        title: item.id == null ? Text('Tambah') : Text('Ubah'),
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            // kode
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: kodeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Kode Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),
            // nama
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),
            // unit
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: unitController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Unit',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ), 
            // harga
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ), 
            // stok
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: stokController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Stok',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ), 
            // img
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: GestureDetector(
                onTap: () => pickImg(),
                child: Column(
                  children: [
                    Text("Image.jpg"),
                    SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: showImgPreview(),
                    ),
                  ]
                ),
              )
            ),
            // tombol button
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  // tombol simpan
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        foregroundColor: Theme.of(context).primaryColorLight, 
                      ),
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        if(imgTemp != null) saveImg(XFile(imgTemp!.path), itemImgName!);
                        setItemArg();
                        // kembali ke layar sebelumnya dengan membawa objek item
                        Navigator.pop(context, item);
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  // tombol batal
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        foregroundColor: Theme.of(context).primaryColorLight, 
                      ),
                      child: Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  showImgPreview(){
    if(imgTemp != null){
      return Image.file(
        imgTemp!,
        width: 200.0,
        height: 200.0,
        fit: BoxFit.fitHeight,
      );
    }else if(imgnya != null){
      return Image.file(
        imgnya!,
        width: 200.0,
        height: 200.0,
        fit: BoxFit.fitHeight,
      );
    }else{
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey[200]
        ),
        width: 200,
        height: 200,
        child: Icon(
          Icons.image_outlined,
          color: Colors.grey[800],
        ),
      );
    }
  }
  
  Future pickImg() async{
    final XFile? pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImg == null) return;
    final imageTemp = File(pickedImg.path);
    String baseimgname = setImgId(basename(imageTemp.path));

    setState(() {
      itemImgName = imgnya != null ? basename(imgnya!.path) : 'none.jpg';
      imgTemp = imageTemp;
      imgController.text = baseimgname;
      setItemArg();
    });
  }

  setImgId(String basename){
    int randomnum = 21417 + Random().nextInt((62073 + 1) - 21417);
    int imgId = randomnum + (item.id != null ? item.id! : 0);
    return 'item${imgId}$basename';
  }

  setItemArg(){
    if (item == null) {
      // tambah data
      item = Item(
        kode: kodeController.text,
        name: nameController.text,
        unit: unitController.text,
        price: int.parse(priceController.text),
        stok: int.parse(stokController.text),
        img: imgController.text
      );
    } else {
      // ubah data
      item.kode = kodeController.text;
      item.name = nameController.text;
      item.unit = unitController.text;
      item.price = int.parse(priceController.text);
      item.stok = int.parse(stokController.text);
      item.img = imgController.text;
    }
  }

  Future saveImg(XFile img, String basenameBefore) async{
    // getting a directory path for saving
    final Directory dir = await getApplicationDocumentsDirectory();
    final String pathTolocal = dir.path;
    // String basenameAfter = basename(File(img.path).path);

    if(basenameBefore != "default.jpg"){
      File prevImg = File("/data/user/0/com.example.flutter_navigasi_route/app_flutter/$basenameBefore");
      var existImg = prevImg.existsSync();
      if(existImg == true){
        try {
          await prevImg.delete();
        } catch (e) {
          return 0;
        }
      }

      // copy the file to a new path
      await img.saveTo('$pathTolocal/${this.imgController.text}');
      print('saved to $pathTolocal/${this.imgController.text}');
    }
  }
}
