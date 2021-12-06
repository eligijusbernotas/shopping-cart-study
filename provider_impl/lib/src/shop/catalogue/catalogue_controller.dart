import 'package:flutter/foundation.dart';
import 'package:provider_impl/src/utils/controller_state.dart';
import 'package:shopping_cart_repository/shopping_cart_repository_core.dart';

class CatalogueController with ChangeNotifier {
  CatalogueController(this._catalogueService) {
    loadItems();
  }

  var _state = ControllerState.initial;
  late var _items = <Item>[];

  final CatalogueRepository _catalogueService;

  ControllerState get state => _state;

  List<Item> get catalogueItems => _items;

  Item getById(int id) => _items.firstWhere((item) => item.id == id);

  Future<void> loadItems() async {
    _state = ControllerState.loading;

    notifyListeners();

    try {
      _items = await _catalogueService.getAll();
    } catch (e) {
      _state = ControllerState.error;
    }

    _state = ControllerState.loaded;

    notifyListeners();
  }
}
