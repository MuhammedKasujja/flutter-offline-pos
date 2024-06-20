part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthUserLoggedIn extends AuthEvent {
  final UserModel user;

  const AuthUserLoggedIn(this.user);

  @override
  List<Object> get props => [user];
}

class AuthLoginAsGuest extends AuthEvent {
  const AuthLoginAsGuest();
}

class AuthUserUnknown extends AuthEvent {
  const AuthUserUnknown();
}
