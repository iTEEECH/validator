abstract class Validator<T> {
  /// [errorText] defines a custom error description displayed
  /// from a validator.
  final String errorText;

  Validator(this.errorText);

  bool isValid(T value);

  String? call(T value) => isValid(value) ? null : errorText;
}

abstract class TextValidator extends Validator<String?> {
  TextValidator(super.errorText);

  bool get shouldIgnoreEmptyValues => true;

  @override
  String? call(String? value) => (shouldIgnoreEmptyValues && value!.isEmpty) ? null : super.call(value);

  bool hasMatch(
    String pattern,
    String input, {
    bool caseSensitive = true,
  }) =>
      RegExp(pattern, caseSensitive: caseSensitive).hasMatch(input);
}
