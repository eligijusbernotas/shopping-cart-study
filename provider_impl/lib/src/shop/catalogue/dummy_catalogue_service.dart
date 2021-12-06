import 'package:shopping_cart_repository/shopping_cart_repository_core.dart';

class DummyCatalogueService implements CatalogueRepository {
  static const _itemNames = ['Apple', 'Pie', 'Carrot', 'Fork', 'Pot', 'Car', 'Plant', 'Shovel', 'Bird', 'Robot'];

  const DummyCatalogueService();

  @override
  Future<List<Item>> getAll() async => Future.delayed(
        const Duration(seconds: 2),
        () => _itemNames.map((name) => Item(_itemNames.indexOf(name), name)).toList(),
      );

  @override
  Future<Item> getById(int id) async => Item(id, _itemNames[id]);
}
