import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:offline_kalteck_pos/core/validations/validations.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc()
      : super(
          SignUpState(
            password: NewPassword.pure(),
            email: Email.pure(),
          ),
        ) {
    on<SignupFirstnameChanged>((event, emit) {
      final firstname = RequiredField.dirty(event.firstname);
      emit(
        state.copyWith(
          firstname: firstname,
          isValid: Formz.validate(
            [
              state.password,
              state.email,
              state.telephone,
              state.lastname,
              firstname,
            ],
          ),
        ),
      );
    });
    on<SignupLastnameChanged>((event, emit) {
      final lastname = RequiredField.dirty(event.lastname);
      emit(
        state.copyWith(
          lastname: lastname,
          isValid: Formz.validate(
            [
              state.password,
              state.email,
              state.telephone,
              state.firstname,
              lastname,
            ],
          ),
        ),
      );
    });
    on<SignupEmailChanged>((event, emit) {
      final email = Email.dirty(event.email);
      emit(
        state.copyWith(
          email: email,
          isValid: Formz.validate(
            [
              state.password,
              state.firstname,
              state.telephone,
              state.lastname,
              email,
            ],
          ),
        ),
      );
    });
    on<SignupTelephoneChanged>((event, emit) {
      final telephone = RequiredField.dirty(event.telephone);
      emit(
        state.copyWith(
          telephone: telephone,
          isValid: Formz.validate(
            [
              state.password,
              state.email,
              state.firstname,
              state.lastname,
              telephone,
            ],
          ),
        ),
      );
    });
    on<SignupPasswordChanged>((event, emit) {
      final password = NewPassword.dirty(event.password);
      emit(
        state.copyWith(
          password: password,
          isValid: Formz.validate(
            [
              state.firstname,
              state.email,
              state.telephone,
              state.lastname,
              password,
            ],
          ),
        ),
      );
    });
    on<SignupSubmitted>((event, emit) {
      if (state.isValid) {
        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
        try {
          // register user
          emit(state.copyWith(status: FormzSubmissionStatus.success));
        } catch (_) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        }
      }
    });
  }
}
