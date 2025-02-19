import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// MatchValidator(
///   r'',
///   errorText: '',
/// )
/// ```
class MatchValidator extends TextValidator {
  /// [pattern] defines a custom pattern matching.
  final Pattern pattern;

  /// [caseSensitive] defines whether the check is case-sensitive.
  final bool caseSensitive;

  MatchValidator(
    this.pattern, {
    required String errorText,
    this.caseSensitive = true,
  }) : super(errorText);

  @override
  bool isValid(String? value) => hasMatch(pattern.toString(), value!, caseSensitive: caseSensitive);
}
