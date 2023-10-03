class Item {
  late int? id;
  late String name;
  late String unit;
  late int price;
  late String img;

  get getId => this.id;

  String get getName => this.name;
  set setName(String name) => this.name = name;

  get getUnit => this.unit;
  set setUnit(unit) => this.unit = unit;

  get getPrice => this.price;
  set setPrice(price) => this.price = price;

  get getImg => this.img;
  set setImg(img) => this.img = img;

  Item({required this.name,required this.unit,required this.price,required this.img});

  Item.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.unit = map['unit'];
    this.price = map['price'];
    this.img = map['img'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['unit'] = unit;
    map['price'] = price;
    map['img'] = img;
    return map;
  }
}
