import 'package:flutter/material.dart';
import 'package:provider_impl/src/shop/cart/cart_item_list_view.dart';

import 'cart_total_price_view.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: const [
          Expanded(
            flex: 9,
            child: CartItemListView(),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CartTotalPriceView(),
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
