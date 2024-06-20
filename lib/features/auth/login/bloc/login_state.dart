part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.username = const Username.pure(),
    this.password = const RequiredField.pure(),
    this.isValid = false,
    this.isRememberPassword = const BooleanField.pure(),
    this.errorMessage,
    this.user,
  });

  final FormzSubmissionStatus status;
  final Username username;
  final RequiredField password;
  final BooleanField isRememberPassword;
  final bool isValid;
  final UserModel? user;
  final String? errorMessage;

  LoginState copyWith({
    FormzSubmissionStatus? status,
    Username? username,
    RequiredField? password,
    bool? isValid,
    BooleanField? isRememberPassword,
    String? errorMessage,
    UserModel? user,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      isRememberPassword: isRememberPassword ?? this.isRememberPassword,
      user: user,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        username,
        password,
        isRememberPassword,
        errorMessage,
        user,
      ];
}
