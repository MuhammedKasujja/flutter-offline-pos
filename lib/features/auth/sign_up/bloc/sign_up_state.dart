part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.status = FormzSubmissionStatus.initial,
    this.firstname = const RequiredField.pure(),
    this.lastname = const RequiredField.pure(),
    this.telephone = const RequiredField.pure(),
    required this.password,
    required this.email,
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final RequiredField firstname;
  final RequiredField lastname;
  final RequiredField telephone;
  final NewPassword password;
  final Email email;
  final bool isValid;

  @override
  List<Object> get props => [
        status,
        firstname,
        lastname,
        password,
        email,
        telephone,
      ];

  SignUpState copyWith({
    FormzSubmissionStatus? status,
    RequiredField? firstname,
    RequiredField? lastname,
    RequiredField? telephone,
    NewPassword? password,
    Email? email,
    bool? isValid,
  }) {
    return SignUpState(
      status: status ?? this.status,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      telephone: telephone ?? this.telephone,
      password: password ?? this.password,
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
    );
  }
}
