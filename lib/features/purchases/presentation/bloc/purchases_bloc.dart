import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:offline_kalteck_pos/core/models/models.dart';
import '../../data/models/purchase_model.dart';
import '../../domain/repositories/purchases_repo_intl.dart';

part 'purchases_event.dart';
part 'purchases_state.dart';

class PurchasesBloc extends Bloc<PurchasesEvent, PurchasesState> {
  final PurchacesRepository purchasesRepo;
  PurchasesBloc({required this.purchasesRepo}) : super(PurchasesState.init()) {
    on<FetchPurchases>((event, emit) async {
      emit(state.load());
      final purchases = await purchasesRepo.fetchPurchases();
      emit(state.loaded(success: true, data: purchases as List<PurchaseModel>));
    });
  }
}
