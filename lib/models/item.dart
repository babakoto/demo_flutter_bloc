import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int id;
  final String name;
  final double price;

  const Item({
    required this.id,
    required this.name,
    required this.price,
  });

  @override
  List<Object> get props => [id, name, price];

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'price': this.price,
    };
  }

  factory Item.fromJson(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as double,
    );
  }
}
