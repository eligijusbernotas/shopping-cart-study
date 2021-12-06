import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider_impl/src/shop/catalogue/catalogue_controller.dart';
import 'package:provider_impl/src/shop/catalogue/dummy_catalogue_service.dart';
import 'package:provider_impl/src/utils/controller_state.dart';

class NotificationListenerCallback extends Mock {
  call();
}

main() {
  group('Catalogue controller', () {
    const dummyService = DummyCatalogueService();
    late CatalogueController catalogueController;

    setUp(() {
      catalogueController = CatalogueController(dummyService);
    });
    test('loadItems changes loading state when fetching', () async {
      final notifListenerCallback = NotificationListenerCallback();
      final controllerStates = <ControllerState>[];

      catalogueController.addListener(() {
        controllerStates.add(catalogueController.state);
        notifListenerCallback();
      });
      expect(catalogueController.state, ControllerState.initial);
      await catalogueController.loadItems();
      verify(notifListenerCallback()).called(2);
      expect(controllerStates, containsAllInOrder([ControllerState.loading, ControllerState.loaded]));
    });
    test('Catalogue items are not empty after fetching', () async {
      await catalogueController.loadItems();
      expect(catalogueController.catalogueItems, isNotEmpty);
    });
    test('get item by correct id and get item', () async {
      const idToGet = 1;

      await catalogueController.loadItems();

      final secondItem = catalogueController.catalogueItems[idToGet];
      final gotItem = catalogueController.getById(idToGet);

      expect(secondItem, gotItem);
    });
    test('get item by incorrect id and get exception', () async {
      await catalogueController.loadItems();
      expect(() => catalogueController.getById(-1), throwsStateError);
    });
  });
}
