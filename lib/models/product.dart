class Product {
  Product({
    required this.id,
    required this.name,
    required this.cover,
    required this.desc,
    required this.price,
  });
  late final int id;
  late final String name;
  late final String? cover;
  late final String desc;
  late final int price;

  Product.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    cover = json['cover'];
    desc = json['desc'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['cover'] = cover;
    _data['desc'] = desc;
    _data['price'] = price;
    return _data;
  }
}