import 'item.dart';

abstract class CatalogueRepository {
  Future<List<Item>> getAll();

  Future<Item> getById(int id);
}
