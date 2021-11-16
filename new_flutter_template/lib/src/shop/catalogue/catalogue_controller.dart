import 'package:new_flutter_template/src/shop/catalogue/catalogue_service.dart';

import '../item.dart';

class CatalogueController {
  CatalogueController(this._catalogueService);

  final CatalogueService _catalogueService;

  List<Item> get catalogueItems => _catalogueService.getAll();
}
