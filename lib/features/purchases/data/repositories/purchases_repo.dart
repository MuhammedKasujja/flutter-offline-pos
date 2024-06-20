import '../models/purchase_model.dart';
import '../../domain/repositories/purchases_repo_intl.dart';

class PurchacesRepositoryImp extends PurchacesRepository {
  @override
  Future<List<PurchaseModel>> fetchPurchases() async {
    return await Future(() => purchases);
  }
}

final List<PurchaseModel> purchases = List.filled(
  30,
  PurchaseModel(
    amount: 60009,
    name: 'Kasujja musa',
    date: DateTime.now(),
    product: 'item1',
    time: '04:50',
  ),
);
