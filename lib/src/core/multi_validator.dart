import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// MultiValidator<T?>(
///   <Validator>[],
///   required: false,
/// )
/// ```
class MultiValidator<T> extends Validator<T?> {
  /// Declaring a final variable `validators` of type `List<StringBaseValidator>`. This variable
  /// is used to store a list of validators that will be used to validate a form field.
  final List<Validator> validators;

  /// Defines a boolean to activate validation of all rules.
  /// Default, [MultiValidator] return a valid boolean when
  /// at least one of the rules is true.
  final bool isAllRequired;

  /// static variable `_errorText` of type `String` and
  /// initializing it with an empty string. This variable is used to store the error message
  static String _errorText = '';

  MultiValidator(
    this.validators, {
    this.isAllRequired = true,
  }) : super(_errorText);

  @override
  bool isValid(value) {
    bool isChecked = false;

    for (final Validator validator in validators) {
      if (validator.call(value) != null) {
        _errorText = validator.call(value)!;
        isChecked = false;
      } else {
        isChecked = true;
      }

      if (!isAllRequired && isChecked) {
        break;
      }
    }
    return isChecked;
  }

  @override
  String? call(T? value) => isValid(value) ? null : _errorText;
}
