import 'package:flutter/material.dart';
import 'package:new_flutter_template/src/shop/cart/cart_controller.dart';

class CartView extends StatelessWidget {
  const CartView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  static const routeName = '/cart';

  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, widget) {
          return ListView(
            children: [
              for (final item in controller.items)
                _CartListItem(
                  title: item.name,
                ),
            ],
          );
        },
      ),
    );
  }
}

class _CartListItem extends StatelessWidget {
  const _CartListItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
    );
  }
}
