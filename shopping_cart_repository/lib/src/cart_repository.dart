import 'item.dart';

abstract class CartRepository {
  Future<void> add(Item item);

  Future<void> remove(Item item);
}
