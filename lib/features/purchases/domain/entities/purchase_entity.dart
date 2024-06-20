import 'package:equatable/equatable.dart';

class PurchaseEntity extends Equatable {
  final String name;
  final DateTime date;
  final String product;
  final String time;
  final double amount;

  const PurchaseEntity({
    required this.name,
    required this.date,
    required this.product,
    required this.time,
    required this.amount,
  });

  @override
  List<Object?> get props => [name, date, product, time, amount];
}
