import 'dart:math';

const _maxId = 2000;

class Item {
  final int id;
  final String name;
  final double price;

  const Item(this.id, this.name, this.price);

  Item.random(this.name)
      : this.id = Random().nextInt(_maxId),
        this.price = Random().nextDouble();

  @override
  bool operator ==(Object other) => other is Item && other.id == id;

  @override
  int get hashCode => id;
}
