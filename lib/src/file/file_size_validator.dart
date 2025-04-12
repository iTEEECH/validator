import 'package:validator/src/validator.dart';

/// Usage :
/// ```dart
/// FileSizeValidator(
///   5.0,
///   errorText: '',
/// )
/// ```
class FileSizeValidator extends Validator<int?> {
  /// [maxSize] defines max size of file.
  final int maxSize;

  FileSizeValidator(
    this.maxSize, {
    required String errorText,
  }) : super(errorText);

  @override
  bool isValid(int? value) {
    try {
      if (value == null) return false;
      final double sizeInMb = (value / (1024 * 1024));
      return (sizeInMb < maxSize);
    } catch (_) {
      return false;
    }
  }
}
