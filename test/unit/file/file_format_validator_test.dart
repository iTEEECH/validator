import 'dart:io' if (dart.library.html) 'dart:html';

import 'package:flutter_test/flutter_test.dart';
import 'package:validator/validator.dart';

void main() {
  // Prerequisite(s).

  // Initialization mock(s) and instance(s).
  setUpAll(() {});

  // Dispose mock(s) and instance(s).
  tearDownAll(() {});

  // Group tests by methods.
  group('FileFormatValidator', () {
    // Parameter(s).
    final List<String> extensions = <String>['pdf', 'png', 'jpg', 'doc', 'docx'];
    final ValueVariant<File> successParameters = ValueVariant<File>(
      {
        File(
          'test/assets/images/filename.jpeg',
        ),
        File('test/assets/images/filename.png'),
      },
    );

    final ValueVariant<File> errorParameters = ValueVariant<File>(
      {
        File('test/assets/images/filename.heic'),
      },
    );

    testWidgets(
      'Should return true when file is valid.',
      (WidgetTester tester) async {
        // Arrange.
        final File parameter = successParameters.currentValue!;

        // Act.
        final bool result = FileFormatValidator(
          extensions,
          errorText: 'errorText',
        ).isValid(parameter);

        // Assert.
        expect(result, isTrue);
      },
      variant: successParameters,
      tags: ['validator'],
    );

    testWidgets(
      'Should return false when file is wrong.',
      (WidgetTester tester) async {
        // Arrange.
        final File parameter = errorParameters.currentValue!;

        // Act.
        final bool result = FileFormatValidator(
          extensions,
          errorText: 'errorText',
        ).isValid(parameter);

        // Assert.
        expect(result, isFalse);
      },
      variant: errorParameters,
      tags: ['validator'],
    );
  });
}
