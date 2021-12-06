import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider_impl/src/shop/catalogue/catalogue_controller.dart';
import 'package:provider_impl/src/shop/catalogue/dummy_catalogue_service.dart';
import 'package:provider_impl/src/utils/controller_state.dart';
import 'package:shopping_cart_repository/shopping_cart_repository_core.dart';

class MockProvider extends Mock {
  call();
}

main() {
  group('Catalogue controller', () {
    const dummyService = DummyCatalogueService();
    final catalogueController = CatalogueController(dummyService);
    test('loadItems changes loading state when fetching', () async {
      final mockProvider = MockProvider();
      final controllerStates = <ControllerState>[];

      catalogueController.addListener(() {
        controllerStates.add(catalogueController.state);
        mockProvider();
      });
      expect(catalogueController.state, ControllerState.initial);
      await catalogueController.loadItems();
      verify(mockProvider()).called(2);
      expect(controllerStates, containsAllInOrder([ControllerState.loading, ControllerState.loaded]));
    });
    test('Catalogue items are not empty after fetching', () {
      expect(catalogueController.catalogueItems, isNotEmpty);
    });
    test('get item by correct id and get item', () async {
      const idToGet = 1;
      final secondItem = Item(idToGet, DummyCatalogueService.itemNames[idToGet]);
      final gotItem = catalogueController.getById(idToGet);

      expect(secondItem, gotItem);
    });
    test('get item by incorrect id and get exception', () {
      expect(() => catalogueController.getById(-1), throwsStateError);
    });
  });
}
