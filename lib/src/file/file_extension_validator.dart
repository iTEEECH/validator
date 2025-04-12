import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// FileExtensionValidator(
///   <String>['png', 'jpg', 'pdf'],
///   errorText: '',
/// )
/// ```
class FileExtensionValidator extends TextValidator {
  /// [_extensions] defines list with values.
  final List<String> _extensions;

  FileExtensionValidator(
    List<String> extensions, {
    required String errorText,
  }) : _extensions = extensions, super(errorText);

  List<String> get extensions => _extensions.map((String extension) => extension.toLowerCase()).toList(growable: false);

  @override
  bool isValid(String? value) {
    try {
      if (value == null || value.trim().isEmpty) {
        return false;
      }
      if (extensions.isEmpty) {
        return false;
      }
      final String extension = value.split('.').last.toLowerCase();
      return extensions.contains(extension);
    } catch (_) {
      return false;
    }
  }
}
