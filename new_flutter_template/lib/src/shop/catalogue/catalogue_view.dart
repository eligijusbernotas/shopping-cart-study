import 'package:flutter/material.dart';
import 'package:new_flutter_template/src/shop/cart/cart_controller.dart';
import 'package:new_flutter_template/src/shop/cart/cart_view.dart';
import 'package:new_flutter_template/src/shop/catalogue/catalogue_controller.dart';

class CatalogueView extends StatelessWidget {
  const CatalogueView({
    Key? key,
    required this.controller,
    required this.cartController,
  }) : super(key: key);

  static const routeName = '/catalogue';

  final CartController cartController;
  final CatalogueController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(CartView.routeName),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: cartController,
        builder: (context, _) {
          return ListView(
            children: [
              for (final item in controller.catalogueItems)
                _ListItem(
                  title: item.name,
                  onAddPressed: cartController.items.contains(item) ? null : () => cartController.add(item),
                )
            ],
          );
        },
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.title,
    this.onAddPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback? onAddPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: IconButton(
        icon: const Icon(Icons.add_shopping_cart),
        onPressed: onAddPressed,
      ),
    );
  }
}
