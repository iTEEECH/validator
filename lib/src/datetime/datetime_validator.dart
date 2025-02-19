import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// DatetimeValidator(
///   errorText: '',
/// )
/// ```
class DatetimeValidator extends TextValidator {
  DatetimeValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) {
    try {
      final DateTime? date = DateTime.tryParse(value!);
      return !(date == null);
    } catch (_) {
      return false;
    }
  }
}
