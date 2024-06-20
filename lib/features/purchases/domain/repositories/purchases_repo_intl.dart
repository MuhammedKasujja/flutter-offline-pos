import '../entities/purchase_entity.dart';

abstract class PurchacesRepository {
  Future<List<PurchaseEntity>> fetchPurchases();
}
