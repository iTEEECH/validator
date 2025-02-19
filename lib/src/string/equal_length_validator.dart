import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// EqualLengthValidator(
///   8,
///   errorText: '',
/// )
/// ```
class EqualLengthValidator extends Validator<String> {
  ///[length] set the exact length of the text field.
  final int length;

  EqualLengthValidator(
    this.length, {
    required String errorText,
  }) : super(errorText);

  @override
  bool isValid(String? value) => value!.length == length;
}
