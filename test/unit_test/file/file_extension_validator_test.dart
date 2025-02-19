import 'package:flutter_test/flutter_test.dart';
import 'package:validator/validator.dart';

void main() {
  // Prerequisite(s).

  // Initialization mock(s) and instance(s).
  setUpAll(() {});

  // Dispose mock(s) and instance(s).
  tearDownAll(() {});

  // Group tests by methods.
  group('FileExtensionValidator', () {
    // Parameter(s).
    final List<String> extensions = <String>['pdf', 'png', 'jpg', 'doc', 'docx'];
    final ValueVariant<String> successParameters = ValueVariant<String>(
      {
        '/some/path/to/filename.jpg',
        '/some/path/to/filename.png',
        '/some/path/to/filename.pdf',
      },
    );

    final ValueVariant<String> errorParameters = ValueVariant<String>(
      {
        '/some/path/to/filename.gif',
        '/some/path/to/filename.xsl',
        '/some/path/to/filename.heic',
      },
    );

    testWidgets(
      'Should return true when file is valid.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = successParameters.currentValue!;

        // Act.
        final bool result = FileExtensionValidator(
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
        final String parameter = errorParameters.currentValue!;

        // Act.
        final bool result = FileExtensionValidator(
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
