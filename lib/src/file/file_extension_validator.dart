import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// FileExtensionValidator(
///   <String>['png', 'jpg', 'pdf'],
///   errorText: '',
/// )
/// ```
class FileExtensionValidator extends TextValidator {
  /// [extensions] defines list with values.
  final List<String> extensions;

  FileExtensionValidator(
    this.extensions, {
    required String errorText,
  }) : super(errorText);

  List<String> get _extensions => extensions.map((String extension) => extension.toLowerCase()).toList(growable: false);

  @override
  bool isValid(String? value) {
    try {
      if (value == null || value.trim().isEmpty || _extensions.isEmpty) {
        return false;
      }
      final String extension = value.split('.').last.toLowerCase();
      return _extensions.contains(extension);
    } catch (_) {
      return false;
    }
  }
}
