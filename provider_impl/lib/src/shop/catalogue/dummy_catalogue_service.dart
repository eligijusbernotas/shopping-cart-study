import 'dart:math';

import 'package:shopping_cart_repository/shopping_cart_repository_core.dart';

class DummyCatalogueService implements CatalogueRepository {
  static const itemNames = ['Apple', 'Pie', 'Carrot', 'Fork', 'Pot', 'Car', 'Plant', 'Shovel', 'Bird', 'Robot'];
  final bool arePricesRandom;
  final double itemPrice;

  const DummyCatalogueService({
    this.arePricesRandom = true,
    this.itemPrice = 0.99,
  });

  @override
  Future<List<Item>> getAll() async => Future.delayed(
        const Duration(seconds: 2),
        () => itemNames
            .map((name) => Item(itemNames.indexOf(name), name, arePricesRandom ? Random().nextDouble() : itemPrice))
            .toList(),
      );

  @override
  Future<Item> getById(int id) async => Item(id, itemNames[id], Random().nextDouble());
}
