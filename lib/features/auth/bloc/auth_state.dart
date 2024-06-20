part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({this.status = AuthenticationStatus.unknown, this.user});
  final AuthenticationStatus status;
  final UserModel? user;

  factory AuthState.unknown() {
    return const AuthState(status: AuthenticationStatus.unknown, user: null);
  }

  factory AuthState.guest() {
    return const AuthState(status: AuthenticationStatus.guest, user: null);
  }

  factory AuthState.authenticated({required UserModel user}) {
    return AuthState(status: AuthenticationStatus.authenticated, user: user);
  }

  @override
  List<Object?> get props => [status, user];
}
