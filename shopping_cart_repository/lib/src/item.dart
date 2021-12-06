import 'dart:math';

class Item {
  final int id;
  final String name;
  final double price = Random().nextDouble();

  Item(this.id, this.name);

  @override
  bool operator ==(Object other) => other is Item && other.id == id;

  @override
  int get hashCode => id;
}
