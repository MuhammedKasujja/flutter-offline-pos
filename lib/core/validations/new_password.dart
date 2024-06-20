import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class NewPasswordValidationError extends Equatable {
  final bool isEmpty;
  final bool isShort;
  final bool noSpecialChar;
  final bool noNumber;
  final bool noUppercase;

  const NewPasswordValidationError({
    required this.isEmpty,
    required this.isShort,
    required this.noSpecialChar,
    required this.noNumber,
    required this.noUppercase,
  });

  bool hasNoError() {
    return !isEmpty &&
        !isShort &&
        !noNumber &&
        !noSpecialChar &&
        !noUppercase;
  }

  @override
  List<Object> get props {
    return [
      isEmpty,
      isShort,
      noUppercase,
      noNumber,
      noSpecialChar,
    ];
  }
}

class NewPassword extends FormzInput<String, NewPasswordValidationError>
    with FormzInputErrorCacheMixin {
  NewPassword.pure() : super.pure('');
  NewPassword.dirty([super.value = '']) : super.dirty();

  static final _oneSpecialChar = RegExp(r"(?=.*[!@#$&*%^])");

  static final _oneNumberChar = RegExp('(?=.*[0-9])');

  static final _oneUppercaseChar = RegExp('(?=.*[A-Z])');

  static const _minPasswordLength = 8;

  @override
  NewPasswordValidationError? validator(String value) {
    final validator = NewPasswordValidationError(
      isEmpty: value.isEmpty,
      isShort: value.length < _minPasswordLength,
      noSpecialChar: !_oneSpecialChar.hasMatch(value),
      noNumber: !_oneNumberChar.hasMatch(value),
      noUppercase: !_oneUppercaseChar.hasMatch(value),
    );
    return validator.hasNoError() ? null : validator;
  }
}
