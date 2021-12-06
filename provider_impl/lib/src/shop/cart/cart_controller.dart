import 'package:flutter/material.dart';
import 'package:provider_impl/src/shop/catalogue/catalogue_controller.dart';
import 'package:shopping_cart_repository/shopping_cart_repository_core.dart';

class CartController with ChangeNotifier {
  late CatalogueController _catalogueController;

  final List<int> _itemIds = [];

  set catalogueController(CatalogueController controller) {
    _catalogueController = controller;

    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _catalogueController.getById(id)).toList();

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
