import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// RequiredValidator(
///   errorText: '',
/// )
/// ```
class RequiredValidator extends TextValidator {
  RequiredValidator({required String errorText}) : super(errorText);

  @override
  bool get shouldIgnoreEmptyValues => false;

  @override
  bool isValid(String? value) => value?.trim().isNotEmpty ?? false;

  @override
  String? call(String? value) => isValid(value) ? null : errorText;
}
