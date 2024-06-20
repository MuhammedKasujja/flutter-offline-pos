part of 'sign_up_bloc.dart';

class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignupFirstnameChanged extends SignUpEvent {
  const SignupFirstnameChanged(this.firstname);

  final String firstname;

  @override
  List<Object> get props => [firstname];
}

class SignupLastnameChanged extends SignUpEvent {
  const SignupLastnameChanged(this.lastname);

  final String lastname;

  @override
  List<Object> get props => [lastname];
}

class SignupEmailChanged extends SignUpEvent {
  const SignupEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class SignupTelephoneChanged extends SignUpEvent {
  const SignupTelephoneChanged(this.telephone);

  final String telephone;

  @override
  List<Object> get props => [telephone];
}

class SignupPasswordChanged extends SignUpEvent {
  const SignupPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SignupSubmitted extends SignUpEvent {
  const SignupSubmitted();
}
