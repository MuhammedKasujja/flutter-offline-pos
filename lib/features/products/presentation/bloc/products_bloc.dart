import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offline_kalteck_pos/core/infra.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../data/models/product_model.dart';
import '../../domain/repositories/product_repo.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;
  ProductsBloc({required this.productsRepository})
      : super(const ProductsState()) {
    on<FetchStockProducts>((event, emit) async {
      emit(state.copyWith(status: AppState.loading));
      final res = await productsRepository.fetchProducts();
      emit(state.copyWith(data: res.data, status: AppState.success));
    });

    on<AddStockProductRows>((event, emit) {
      final List<Product> newProducts = [];
      for (var row in event.rows) {
        newProducts.add(
          Product(
            id: row.cells['id']?.value ?? 'ererere',
            name: row.cells['name']?.value ?? 'trytyt',
            sellingPrice: row.cells['sellingPrice']?.value ?? 7890,
            costPrice: row.cells['costPrice']?.value ?? 4567,
            total: row.cells['total']?.value ?? 0,
            totalItemsRemaining: row.cells['totalItemsRemaining']?.value ?? 0,
          ),
        );
      }
      add(SaveStockProductToDb(products: newProducts));
    });

    on<SaveStockProductToDb>((event, emit) {
      Logger.debug(data: event.products.length, key: 'SaveStockProductToDb');
    });
  }
}
