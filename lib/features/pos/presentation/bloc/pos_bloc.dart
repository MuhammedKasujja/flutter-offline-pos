import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pos_event.dart';
part 'pos_state.dart';

class PosBloc extends Bloc<PosEvent, PosState> {
  PosBloc() : super(PosInitial()) {
    on<PosEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
