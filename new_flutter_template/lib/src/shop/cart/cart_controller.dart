import 'package:flutter/material.dart';
import 'package:new_flutter_template/src/shop/catalogue/catalogue_service.dart';
import 'package:new_flutter_template/src/shop/item.dart';

class CartController with ChangeNotifier {
  CartController(this._catalogueService);

  final CatalogueService _catalogueService;

  final List<int> _itemIds = [];

  List<Item> get items => _itemIds.map((id) => _catalogueService.getById(id)).toList();

  double get totalPrice => items.fold(0.0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);

    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);

    notifyListeners();
  }
}
