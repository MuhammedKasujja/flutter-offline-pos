import 'dart:convert';

import '../../domain/entities/product.dart';

class Product extends ProductEntity {
  const Product({
    required super.id,
    required super.name,
    required super.sellingPrice,
    required super.costPrice,
    required super.total,
    required super.totalItemsRemaining,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'sellingPrice': sellingPrice,
      'costPrice': costPrice,
      'total': total,
      'totalItemsRemaining': totalItemsRemaining,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      sellingPrice: map['sellingPrice'] as double,
      costPrice: map['costPrice'] as double,
      total: map['total'] as int,
      totalItemsRemaining: map['totalItemsRemaining'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
