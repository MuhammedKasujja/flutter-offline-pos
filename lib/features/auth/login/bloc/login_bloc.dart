import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../../core/validations/validations.dart';
import '../../data/models/user.dart';
import '../../data/repositories/auth_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc({required this.authRepository}) : super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginRememberPasswordChanged>(_onRemeberPasswordToggled);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginFailure>(_onLoginFailure);
  }
  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate(
            [state.password, state.isRememberPassword, username]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = RequiredField.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate(
            [password, state.username, state.isRememberPassword]),
      ),
    );
  }

  void _onRemeberPasswordToggled(
    LoginRememberPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    // TODO isRequired: true, is expensive when updating UI
    final isRememberPassword = BooleanField.dirty(
      value: !state.isRememberPassword.value,
    );
    // print(
    //     'isRememberPassword: $isRememberPassword ${state.isRememberPassword.value}');
    emit(
      state.copyWith(
        isRememberPassword: isRememberPassword,
        isValid: Formz.validate(
            [state.password, state.username, isRememberPassword]),
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await Future.delayed(const Duration(seconds: 5));
      try {
        final res = await authRepository.login(
          email: state.username.value,
          password: state.password.value,
        );
        if (!res.success) {
          throw Exception(res.message);
        }
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.success,
            user: res.data,
          ),
        );
      } catch (error) {
        add(LoginFailure(error.toString().split(':')[1]));
      }
    }
  }

  void _onLoginFailure(
    LoginFailure event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        errorMessage: event.error,
        status: FormzSubmissionStatus.failure,
      ),
    );
  }
}
