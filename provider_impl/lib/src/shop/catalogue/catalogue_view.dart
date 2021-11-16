import 'package:flutter/material.dart';
import 'package:provider_impl/src/shop/cart/cart_view.dart';

import 'catalogue_item_list_view.dart';

class CatalogueView extends StatelessWidget {
  const CatalogueView({Key? key}) : super(key: key);

  static const routeName = '/catalogue';

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
      body: const CatalogueItemListView(),
    );
  }
}
