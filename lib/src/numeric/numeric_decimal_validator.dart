import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// NumericDecimalValidator(
///   errorText: '',
/// )
/// ```
class NumericDecimalValidator extends TextValidator {
  /// Decimal pattern matching.
  final Pattern _pattern = r'^\d+(\.\d{2})?$';

  NumericDecimalValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) => hasMatch(_pattern.toString(), value!, caseSensitive: false);
}
