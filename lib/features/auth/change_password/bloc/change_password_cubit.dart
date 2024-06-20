import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:offline_kalteck_pos/core/validations/validations.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit()
      : super(
           ChangePasswordState(
            oldPassword: const Password.pure(),
            password: NewPassword.pure(),
          ),
        );

  void oldPasswordChanged(String value) {
    final oldPassword = Password.dirty(value);
    emit(
      state.copyWith(
        oldPassword: oldPassword,
        isValid: Formz.validate([
          oldPassword,
          state.password,
          state.confirmedPassword,
        ]),
      ),
    );
  }

  void newPasswordChanged(String value) {
    final password = NewPassword.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate([
          state.oldPassword,
          password,
          confirmedPassword,
        ]),
      ),
    );
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate([
          state.oldPassword,
          state.password,
          confirmedPassword,
        ]),
      ),
    );
  }

  Future<void> changePasswordFormSubmitted() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      // make api call
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
