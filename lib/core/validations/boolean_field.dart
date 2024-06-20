import 'package:formz/formz.dart';

enum BooleanFieldValidationError { invalid }

class BooleanField extends FormzInput<bool, BooleanFieldValidationError> {
  const BooleanField.pure({this.isRequired = false}) : super.pure(false);
  const BooleanField.dirty({this.isRequired = false, bool value = false})
      : super.dirty(value);

  final bool isRequired;

  @override
  BooleanFieldValidationError? validator(bool value) {
    if (isRequired && value == false) {
      return BooleanFieldValidationError.invalid;
    }
    return null;
  }
}
