import 'package:shopping_cart_repository/shopping_cart_repository_core.dart';

class DummyCatalogueService implements CatalogueRepository {
  static const itemNames = ['Apple', 'Pie', 'Carrot', 'Fork', 'Pot', 'Car', 'Plant', 'Shovel', 'Bird', 'Robot'];

  const DummyCatalogueService();

  @override
  Future<List<Item>> getAll() async => Future.delayed(
        const Duration(seconds: 2),
        () => itemNames.map((name) => Item(itemNames.indexOf(name), name)).toList(),
      );

  @override
  Future<Item> getById(int id) async => Item(id, itemNames[id]);
}
