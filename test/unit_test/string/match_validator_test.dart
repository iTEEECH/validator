import 'package:flutter_test/flutter_test.dart';
import 'package:validator/validator.dart';

void main() {
  // Prerequisite(s).

  // Initialization mock(s) and instance(s).
  setUpAll(() {});

  // Dispose mock(s) and instance(s).
  tearDownAll(() {});

  // Group tests by methods.
  group('MatchValidator', () {
    // Parameter(s).
    const Pattern pattern = r'[0-9]';
    final ValueVariant<String> successParameters = ValueVariant<String>(
      {
        '10',
        '100',
        'Lorem Ipsum et 1000.',
      },
    );

    final ValueVariant<String> errorParameters = ValueVariant<String>(
      {
        '',
        ' ',
        'Lorem Ipsum.',
      },
    );

    testWidgets(
      'Should return true when value is valid.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = successParameters.currentValue!;

        // Act.
        final bool result = MatchValidator(
          pattern,
          errorText: 'errorText',
        ).isValid(parameter);

        // Assert.
        expect(result, isTrue);
      },
      variant: successParameters,
      tags: ['validator'],
    );

    testWidgets(
      'Should return false when value is wrong.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = errorParameters.currentValue!;

        // Act.
        final bool result = MatchValidator(
          pattern,
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
