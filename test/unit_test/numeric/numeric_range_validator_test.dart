import 'package:flutter_test/flutter_test.dart';
import 'package:validator/validator.dart';

void main() {
  // Prerequisite(s).

  // Initialization mock(s) and instance(s).
  setUpAll(() {});

  // Dispose mock(s) and instance(s).
  tearDownAll(() {});

  // Group tests by methods.
  group('NumericValidator', () {
    // Parameter(s).
    final num start = 100, end = 200;
    final ValueVariant<String> successParameters = ValueVariant<String>(
      {
        '100',
        '150',
        '200',
      },
    );

    final ValueVariant<String> errorParameters = ValueVariant<String>(
      {
        '0',
        '50',
        '500',
      },
    );

    testWidgets(
      'Should return true when content is valid.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = successParameters.currentValue!;

        // Act.
        final bool result = NumericRangeValidator(
          start,
          end,
          errorText: 'errorText',
        ).isValid(parameter);

        // Assert.
        expect(result, isTrue);
      },
      variant: successParameters,
      tags: ['validator'],
    );

    testWidgets(
      'Should return false when email is wrong.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = errorParameters.currentValue!;

        // Act.
        final bool result = NumericRangeValidator(
          start,
          end,
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
