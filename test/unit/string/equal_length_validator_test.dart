import 'package:flutter_test/flutter_test.dart';
import 'package:validator/validator.dart';

void main() {
  // Prerequisite(s).

  // Initialization mock(s) and instance(s).
  setUpAll(() {});

  // Dispose mock(s) and instance(s).
  tearDownAll(() {});

  // Group tests by methods.
  group('EqualLengthValidator', () {
    // Parameter(s).
    const int length = 12;
    final ValueVariant<String> successParameters = ValueVariant<String>(
      {
        'Lorem ipsum.',
      },
    );
    final ValueVariant<String> errorParameters = ValueVariant<String>(
      {
        '',
        'Lorem',
        'Lorem ipsum',
      },
    );

    testWidgets(
      'Should return true when length is valid.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = successParameters.currentValue!;

        // Act.
        final bool result = EqualLengthValidator(
          length,
          errorText: 'errorText',
        ).isValid(parameter);

        // Assert.
        expect(result, isTrue);
      },
      variant: successParameters,
      tags: ['validator'],
    );

    testWidgets(
      'Should return false when length is wrong.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = errorParameters.currentValue!;

        // Act.
        final bool result = EqualLengthValidator(
          length,
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
