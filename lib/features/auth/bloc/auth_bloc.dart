import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/models/models.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.unknown()) {
    on<AuthUserLoggedIn>((event, emit) {
      emit(AuthState.authenticated(user: event.user));
    });

    on<AuthLoginAsGuest>((event, emit) {
      emit(AuthState.guest());
    });

    on<AuthUserUnknown>((event, emit) {
      emit(AuthState.unknown());
    });
  }
}
