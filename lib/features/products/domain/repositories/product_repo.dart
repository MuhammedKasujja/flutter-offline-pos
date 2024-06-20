import 'package:offline_kalteck_pos/core/models/models.dart';

import '../../data/models/product_model.dart';

abstract class ProductsRepository {
  Future<ApiResponse<List<Product>>> fetchProducts();
}