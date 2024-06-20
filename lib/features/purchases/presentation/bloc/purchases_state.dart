part of 'purchases_bloc.dart';

@immutable
class PurchasesState extends Equatable {
  final String? error;
  final String? message;
  final AppState status;
  final List<PurchaseModel>? data;
  final bool success;

  const PurchasesState({
    this.error,
    this.message,
    required this.success,
    required this.status,
    this.data,
  });

  factory PurchasesState.init() {
    return const PurchasesState(
      status: AppState.init,
      success: false,
    );
  }

  PurchasesState load() {
    return PurchasesState(
      data: data,
      status: AppState.loading,
      success: false,
    );
  }

  PurchasesState loaded({
    String? error,
    String? message,
    List<PurchaseModel>? data,
    required bool success,
  }) {
    return PurchasesState(
      message: message,
      error: error,
      data: data ?? this.data,
      status: AppState.success,
      success: success,
    );
  }

  PurchasesState failure(
    String? error,
  ) {
    return PurchasesState(
      error: error,
      data: data,
      status: AppState.failure,
      success: false,
    );
  }

  @override
  List<Object?> get props => [
        message,
        error,
        status,
        success,
        data,
      ];
}
