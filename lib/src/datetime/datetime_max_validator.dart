import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// DatetimeMaxValidator(
///   DateTime.parse(2024-01-01),
///   errorText: '',
/// )
/// ```
class DatetimeMaxValidator extends TextValidator {
  /// [max] defines the maximum date.
  final DateTime max;

  DatetimeMaxValidator(
    this.max, {
    required String errorText,
  }) : super(errorText);

  @override
  bool isValid(String? value) {
    try {
      final DateTime? date = DateTime.tryParse(value!);
      return !(date == null || date.isAfter(max));
    } catch (_) {
      return false;
    }
  }
}
