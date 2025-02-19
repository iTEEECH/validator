import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// MinLengthValidator(
///   8,
///   errorText: '',
/// )
/// ```
class MinLengthValidator extends Validator<String> {
  ///[min] set min length of the text field.
  final int min;

  MinLengthValidator(
    this.min, {
    required String errorText,
  }) : super(errorText);

  @override
  bool isValid(String? value) => value!.length >= min;
}
