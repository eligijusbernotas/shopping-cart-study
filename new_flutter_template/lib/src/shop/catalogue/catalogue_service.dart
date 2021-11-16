import 'package:new_flutter_template/src/shop/item.dart';

class CatalogueService {
  static const _itemNames = ['Apple', 'Pie', 'Carrot', 'Fork', 'Pot', 'Car', 'Plant', 'Shovel', 'Bird', 'Robot'];

  List<Item> getAll() => _itemNames.map((name) => Item(_itemNames.indexOf(name), name)).toList();

  Item getById(int id) => Item(id, _itemNames[id]);
}
