import 'package:flutter/material.dart';
import 'package:flutter_navigasi_route/models/item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Item itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Description"),
      ),
      // body: Center(child: Text("${itemArgs.name} with ${itemArgs.price}")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Image.asset("lib/assets/img/${itemArgs.img}"),
            ),
            // SizedBox(height: 12),
            Text("${itemArgs.name}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: 10),
            Text("Rp ${itemArgs.price}",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10),
            Text("For purchases per ${itemArgs.unit}",),
          ],
        ),
      ),
    );
  }
}
