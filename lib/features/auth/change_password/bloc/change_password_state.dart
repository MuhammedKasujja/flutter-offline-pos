part of 'change_password_cubit.dart';

class ChangePasswordState extends Equatable {
  const ChangePasswordState({
    this.isValid = false,
    this.errorMessage,
    this.status = FormzSubmissionStatus.initial,
    required this.oldPassword,
    required this.password,
    this.confirmedPassword = const ConfirmedPassword.pure(),
  });

  final FormzSubmissionStatus status;
  final Password oldPassword;
  final NewPassword password;
  final ConfirmedPassword confirmedPassword;
  final bool isValid;
  final String? errorMessage;

  @override
  List<Object?> get props {
    return [
      status,
      oldPassword,
      password,
      confirmedPassword,
      isValid,
      errorMessage,
    ];
  }

  ChangePasswordState copyWith({
    FormzSubmissionStatus? status,
    Password? oldPassword,
    NewPassword? password,
    ConfirmedPassword? confirmedPassword,
    bool? isValid,
    String? errorMessage,
  }) {
    return ChangePasswordState(
      status: status ?? this.status,
      oldPassword: oldPassword ?? this.oldPassword,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage,
    );
  }
}
