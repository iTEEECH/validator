import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// DatetimeRangeValidator(
///   DateTime.parse(2024-01-01),
///   DateTime.parse(2025-01-01),
///   errorText: '',
/// )
/// ```
class DatetimeRangeValidator extends TextValidator {
  /// [start] defines the start date.
  final DateTime start;

  /// [end] defines the end date.
  final DateTime end;

  DatetimeRangeValidator(
    this.start,
    this.end, {
    required String errorText,
  }) : super(errorText);

  @override
  bool isValid(String? value) {
    try {
      final DateTime? date = DateTime.tryParse(value!);
      return !(date == null || date.isBefore(start) || date.isAfter(end));
    } catch (_) {
      return false;
    }
  }
}
