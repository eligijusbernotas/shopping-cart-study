import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_impl/src/shop/cart/cart_view.dart';
import 'package:provider_impl/src/shop/catalogue/catalogue_controller.dart';
import 'package:provider_impl/src/utils/controller_state.dart';
import 'package:provider_impl/src/widgets/loading_widget.dart';

import 'catalogue_item_list_view.dart';

class CatalogueView extends StatelessWidget {
  const CatalogueView({Key? key}) : super(key: key);

  static const routeName = '/catalogue';

  Widget _buildBody(BuildContext context) {
    var state = context.select<CatalogueController, ControllerState>((catalogue) => catalogue.state);
    const listView = CatalogueItemListView(
      key: ValueKey("catalogue_item_list_view"),
    );

    switch (state) {
      case ControllerState.loading:
        final itemsCount = context.read<CatalogueController>().catalogueItems.length;

        if (itemsCount <= 0) {
          return const LoadingWidget(
            key: ValueKey("loading_widget"),
          );
        } else {
          return listView;
        }
      case ControllerState.loaded:
        return listView;
      case ControllerState.error:
        return ErrorWidget("");
      case ControllerState.initial:
        return listView;
    }
  }

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
      body: Builder(
        builder: (context) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _buildBody(context),
        ),
      ),
    );
  }
}
