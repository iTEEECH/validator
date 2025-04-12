import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// StringValidator(
///   errorText: '',
/// )
/// ```
class StringValidator extends TextValidator {
  /// Alphabet pattern matching.
  final Pattern _pattern = r'^[a-zA-Z]+$';

  StringValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) => hasMatch(_pattern.toString(), value!, caseSensitive: false);
}
