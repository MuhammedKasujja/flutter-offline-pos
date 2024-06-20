import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final double sellingPrice;
  final double costPrice;
  final int total;
  final int totalItemsRemaining;
  const ProductEntity({
    required this.id,
    required this.name,
    required this.sellingPrice,
    required this.costPrice,
    required this.total,
    required this.totalItemsRemaining,
  });

  ProductEntity copyWith({
    String? id,
    String? name,
    double? sellingPrice,
    double? costPrice,
    int? total,
    int? totalItemsRemaining,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      costPrice: costPrice ?? this.costPrice,
      total: total ?? this.total,
      totalItemsRemaining: totalItemsRemaining ?? this.totalItemsRemaining,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      sellingPrice,
      costPrice,
      total,
      totalItemsRemaining,
    ];
  }
}
