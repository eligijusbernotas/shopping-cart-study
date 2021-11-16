import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_impl/src/shop/cart/cart_controller.dart';
import 'package:provider_impl/src/shop/catalogue/catalogue_controller.dart';
import 'package:provider_impl/src/shop/item.dart';

class CatalogueItemListView extends StatelessWidget {
  const CatalogueItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catalogueController = context.watch<CatalogueController>();

    return ListView.builder(
      itemCount: catalogueController.catalogueItems.length,
      itemBuilder: (context, index) {
        final item = catalogueController.catalogueItems[index];
        return _ListItem(
          item: item,
        );
      },
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      trailing: _AddToCartButton(item: item),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton({Key? key, required this.item}) : super(key: key);

  final Item item;

  void _onAddToCart(BuildContext context) {
    final cartController = context.read<CartController>();
    cartController.add(item);
  }

  @override
  Widget build(BuildContext context) {
    final isInCart = context.select<CartController, bool>(
      (cart) => cart.items.contains(item),
    );

    return ElevatedButton(
      onPressed: isInCart ? null : () => _onAddToCart(context),
      child: isInCart ? const Icon(Icons.check) : const Icon(Icons.add_shopping_cart),
    );
  }
}
