part of 'products_bloc.dart';

class ProductsState extends Equatable {
  const ProductsState(
      {this.data, this.status = AppState.init, this.errorMessage});
  final List<Product>? data;
  final AppState status;
  final String? errorMessage;

  @override
  List<Object?> get props => [data, status, errorMessage];

  ProductsState copyWith({
    List<Product>? data,
    AppState? status,
    String? errorMessage,
  }) {
    return ProductsState(
      data: data ?? this.data,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
