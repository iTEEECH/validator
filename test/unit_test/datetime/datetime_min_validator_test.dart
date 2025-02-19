import 'package:flutter_test/flutter_test.dart';
import 'package:validator/validator.dart';

void main() {
  // Prerequis(s).

  // Initialization mock(s) and instance(s).
  setUpAll(() {});

  // Dispose mock(s) and instance(s).
  tearDownAll(() {});

  // Group tests by methods.
  group('DatetimeMinValidator', () {
    // Parameter(s).
    final DateTime min = DateTime.parse('2025-01-01');
    final ValueVariant<String> successParameters = ValueVariant<String>(
      {
        DateTime.parse('2050-01-01').toIso8601String(),
      },
    );
    final ValueVariant<String> errorParameters = ValueVariant<String>(
      {
        DateTime.parse('2000-01-01').toIso8601String(),
      },
    );

    testWidgets(
      'Should return true when datetime min is valid.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = successParameters.currentValue!;

        // Act.
        final bool result = DatetimeMinValidator(
          min,
          errorText: 'errorText',
        ).isValid(parameter);

        // Assert.
        expect(result, isTrue);
      },
      variant: successParameters,
      tags: ['validator'],
    );

    testWidgets(
      'Should return false when datetime min is wrong.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = errorParameters.currentValue!;

        // Act.
        final bool result = DatetimeMinValidator(
          min,
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
