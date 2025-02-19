import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// NumericValidator(
///   errorText: '',
/// )
/// ```
class NumericValidator extends TextValidator {
  NumericValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) {
    try {
      final num? number = num.tryParse(value!);
      return !(number == null);
    } catch (_) {
      return false;
    }
  }
}
