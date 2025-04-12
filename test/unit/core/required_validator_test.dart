import 'package:flutter_test/flutter_test.dart';
import 'package:validator/validator.dart';

void main() {
  // Prerequis(s).

  // Initialization mock(s) and instance(s).
  setUpAll(() {});

  // Dispose mock(s) and instance(s).
  tearDownAll(() {});

  // Group tests by methods.
  group('RequiredValidator', () {
    // Parameter(s).
    final ValueVariant<String> successParameters = ValueVariant<String>(
      {
        'Lorem Ipsum',
      },
    );
    final ValueVariant<String?> errorParameters = ValueVariant<String?>(
      {
        null,
        '',
        ' ',
      },
    );

    testWidgets(
      'Should return true when content is valid.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = successParameters.currentValue!;

        // Act.
        final bool result = RequiredValidator(errorText: 'errorText').isValid(parameter);

        // Assert.
        expect(result, isTrue);
      },
      variant: successParameters,
      tags: ['validator'],
    );

    testWidgets(
      'Should return false when content is wrong.',
      (WidgetTester tester) async {
        // Arrange.
        final String? parameter = errorParameters.currentValue;

        // Act.
        final bool result = RequiredValidator(errorText: 'errorText').isValid(parameter);

        // Assert.
        expect(result, isFalse);
      },
      variant: errorParameters,
      tags: ['validator'],
    );
  });
}
