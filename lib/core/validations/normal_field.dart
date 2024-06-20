import 'package:formz/formz.dart';

enum NormalFieldValidationError { empty }

class NormalField extends FormzInput<String, NormalFieldValidationError> {
  const NormalField.pure() : super.pure('');
  const NormalField.dirty([super.value = '']) : super.dirty();

  @override
  NormalFieldValidationError? validator(String value) {
    // if (value.isEmpty) return NormalFieldValidationError.empty;
    return null;
  }
}
