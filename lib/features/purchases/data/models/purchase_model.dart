import '../../domain/entities/purchase_entity.dart';

class PurchaseModel extends PurchaseEntity {
  const PurchaseModel({
    required super.name,
    required super.date,
    required super.product,
    required super.time,
    required super.amount,
  });
}
