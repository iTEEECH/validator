import 'dart:io' if (dart.library.html) 'dart:html';

import 'package:mime/mime.dart';
import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// FileFormatValidator(
///   <String>['png', 'jpeg', 'pdf'],
///   errorText: '',
/// )
/// ```
class FileFormatValidator extends Validator<File?> {
  /// [extensions] defines list with values.
  final List<String> _extensions;

  FileFormatValidator(
      List<String> extensions, {
        required String errorText,
      }) : _extensions = extensions, super(errorText);

  List<String> get extensions => _extensions.map((String extension) => extension.toLowerCase()).toList();

  @override
  bool isValid(File? value) {
    try {
      if (value == null) return false;
      final String mimeType = lookupMimeType(value.path, headerBytes: value.readAsBytesSync())!;

      // Formats (JPEG JPG).
      if (mimeType == 'image/jpeg') {
        _extensions.add('jpe');
      }

      return extensions.contains(extensionFromMime(mimeType)?.toLowerCase());
    } catch (_) {
      return false;
    }
  }
}
