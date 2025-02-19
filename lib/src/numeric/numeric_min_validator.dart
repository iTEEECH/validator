import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// NumericMinValidator(
///   0,
///   errorText: '',
/// )
/// ```
class NumericMinValidator extends TextValidator {
  /// [min] defines minimum number.
  final num min;

  NumericMinValidator(
    this.min, {
    required String errorText,
  }) : super(errorText);

  @override
  bool isValid(String? value) {
    try {
      final num number = num.parse(value!);
      return number >= min;
    } catch (_) {
      return false;
    }
  }
}
