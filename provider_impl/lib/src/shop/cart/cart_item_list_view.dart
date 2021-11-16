import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_impl/src/shop/cart/cart_controller.dart';
import 'package:provider_impl/src/shop/item.dart';

class CartItemListView extends StatelessWidget {
  const CartItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();

    return ListView.builder(
      itemCount: cartController.items.length,
      itemBuilder: (context, index) => _CartListItem(
        item: cartController.items[index],
      ),
    );
  }
}

class _CartListItem extends StatelessWidget {
  const _CartListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    final cartController = context.read<CartController>();

    return ListTile(
      title: Text(item.name),
      trailing: IconButton(
        color: Colors.red.shade500,
        icon: const Icon(Icons.remove),
        onPressed: () => cartController.remove(item),
      ),
    );
  }
}
