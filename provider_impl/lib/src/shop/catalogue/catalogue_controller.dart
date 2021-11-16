import '../item.dart';
import 'catalogue_service.dart';

class CatalogueController {
  CatalogueController(this._catalogueService);

  late var _items = <Item>[];

  final CatalogueService _catalogueService;

  List<Item> get catalogueItems => _items;

  Item getById(int id) => _items.firstWhere((item) => item.id == id);

  void loadItems() => _items = _catalogueService.getAll();
}
