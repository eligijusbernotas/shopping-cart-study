import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider_impl/src/shop/cart/cart_controller.dart';
import 'package:provider_impl/src/shop/catalogue/catalogue_controller.dart';
import 'package:provider_impl/src/shop/catalogue/dummy_catalogue_service.dart';

class NotificationListenerCallback extends Mock {
  call();
}

main() {
  group('Cart controller', () {
    const itemPrice = 2.0;
    late CatalogueController catalogueController;
    late CartController cartController;
    final notifListenerCallback = NotificationListenerCallback();

    setUp(() async {
      catalogueController =
          CatalogueController(const DummyCatalogueService(arePricesRandom: false, itemPrice: itemPrice));
      cartController = CartController();
      cartController.catalogueController = catalogueController;
      cartController.addListener(notifListenerCallback);
      reset(notifListenerCallback);

      await catalogueController.loadItems();
    });

    //TODO: Look into unit test architectures, testing one unit but expecting multiple after effects, good, bad?
    test('Adding items adds items to cart\'s item list', () {
      cartController.add(catalogueController.catalogueItems[0]);
      expect(cartController.items.length, 1);
      expect(cartController.items, contains(catalogueController.catalogueItems[0]));
      expect(cartController.totalPrice, itemPrice);

      cartController.add(catalogueController.catalogueItems[1]);
      verify(notifListenerCallback()).called(2);
      expect(cartController.items.length, 2);
      expect(
          cartController.items,
          containsAll([
            catalogueController.catalogueItems[0],
            catalogueController.catalogueItems[1],
          ]));
      expect(cartController.totalPrice, itemPrice * 2);
    });
    test('Removing items from cart\'s item list removes items', () {
      cartController.add(catalogueController.catalogueItems[0]);
      cartController.add(catalogueController.catalogueItems[1]);
      cartController.remove(catalogueController.catalogueItems[0]);
      expect(cartController.items.length, 1);
      expect(cartController.items, contains(catalogueController.catalogueItems[1]));
      expect(cartController.totalPrice, itemPrice);

      cartController.remove(catalogueController.catalogueItems[1]);
      verify(notifListenerCallback()).called(4);
      expect(cartController.items.length, 0);
      expect(cartController.items, isEmpty);
      expect(cartController.totalPrice, 0.0);
    });
  });
}
