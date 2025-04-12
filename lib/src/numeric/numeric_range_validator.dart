import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// NumericValidator(
///   0,
///   10,
///   errorText: '',
/// )
/// ```
class NumericRangeValidator extends TextValidator {
  /// [start] defines start number.
  final num start;

  /// [end] defines end number.
  final num end;

  NumericRangeValidator(
    this.start,
    this.end, {
    required String errorText,
  }) : super(errorText);

  @override
  bool isValid(String? value) {
    try {
      final num number = num.parse(value!);
      return (number >= start && number <= end);
    } catch (_) {
      return false;
    }
  }
}
