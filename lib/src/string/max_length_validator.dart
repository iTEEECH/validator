import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// MaxLengthValidator(
///   8,
///   errorText: '',
/// )
/// ```
class MaxLengthValidator extends Validator<String> {
  ///[max] set the max length of the text field.
  final int max;

  MaxLengthValidator(
    this.max, {
    required String errorText,
  }) : super(errorText);

  @override
  bool isValid(String? value) => value!.length <= max;
}
