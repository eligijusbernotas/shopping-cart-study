import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_impl/src/shop/cart/cart_controller.dart';

class CartTotalPriceView extends StatelessWidget {
  const CartTotalPriceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total",
          style: textTheme.headline5,
        ),
        Text(
          '${cartController.totalPrice.toStringAsFixed(2)} \$',
          style: textTheme.headline5,
        ),
      ],
    );
  }
}
