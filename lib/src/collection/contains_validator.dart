import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// ContainsEValidator<T>(
///   <T>[],
///   errorText: '',
/// )
/// ```
class ContainsValidator<T> extends Validator<T> {
  /// [values] defines a list of type T in order
  /// to check the presence of the value.
  final List<T> values;

  /// [caseSensitive] defines boolean to enable case sensitive.
  /// Default value: false.
  final bool caseSensitive;

  ContainsValidator(
    this.values, {
    this.caseSensitive = true,
    required String errorText,
  }) : super(errorText);

  List<String> get _values => (values as List<String>).map((String value) => value.toLowerCase()).toList(growable: false);

  @override
  bool isValid(T value) => (value is String && !caseSensitive) ? _values.contains(value.toLowerCase()) : values.contains(value);
}
