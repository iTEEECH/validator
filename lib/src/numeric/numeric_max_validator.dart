import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// NumericMaxValidator(
///   10,
///   errorText: '',
/// )
/// ```
class NumericMaxValidator extends TextValidator {
  /// [max] defines maximum number.
  final num max;

  NumericMaxValidator(
    this.max, {
    required String errorText,
  }) : super(errorText);

  @override
  bool isValid(String? value) {
    try {
      final num number = num.parse(value!);
      return number <= max;
    } catch (_) {
      return false;
    }
  }
}
