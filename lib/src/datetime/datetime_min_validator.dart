import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// DatetimeMinValidator(
///   DateTime.parse(2024-01-01),
///   errorText: '',
/// )
/// ```
class DatetimeMinValidator extends TextValidator {
  /// [min] defines the minimum date.
  final DateTime min;

  DatetimeMinValidator(
    this.min, {
    required String errorText,
  }) : super(errorText);

  @override
  bool isValid(String? value) {
    try {
      final DateTime? date = DateTime.tryParse(value!);
      return !(date == null || date.isBefore(min));
    } catch (_) {
      return false;
    }
  }
}
