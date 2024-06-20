part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchStockProducts extends ProductsEvent {}

class AddStockProductRows extends ProductsEvent {
  final List<PlutoRow> rows;

  const AddStockProductRows({required this.rows});
  @override
  List<Object> get props => [rows];
}

class SaveStockProductToDb extends ProductsEvent {
  final List<Product> products;

  const SaveStockProductToDb({required this.products});
  @override
  List<Object> get props => [products];
}
