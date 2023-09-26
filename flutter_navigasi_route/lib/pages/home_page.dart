import 'package:flutter/material.dart';
import 'package:flutter_navigasi_route/models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', unit: "gram", price: 5000, img: "sugar.jpg"),
    Item(name: 'Salt', unit: "gram", price: 2000, img: "salt.jpg"),
    Item(name: 'Soy Sauce', unit: "liter", price: 6000, img: "kecap.jpg"),
    Item(name: 'Cheese', unit: "gram", price: 6000, img: "cheese.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('lib/assets/img/${item.img}'),
                ),
                title: Text(
                  '${item.name}',
                ),
                subtitle: Text('${item.price} per ${item.unit}'),
                trailing: Icon(Icons.more_horiz),
              ),
            );
          },
        ),
      ),
    );
  }
}
