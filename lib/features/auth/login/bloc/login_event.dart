part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginRememberPasswordChanged extends LoginEvent {
  const LoginRememberPasswordChanged();
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

class LoginFailure extends LoginEvent {
  final String error;
  const LoginFailure(this.error);
  @override
  List<Object> get props => [error];
}
