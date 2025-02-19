import 'package:flutter_test/flutter_test.dart';
import 'package:validator/validator.dart';

void main() {
  // Prerequisite(s).

  // Initialization mock(s) and instance(s).
  setUpAll(() {});

  // Dispose mock(s) and instance(s).
  tearDownAll(() {});

  // Group tests by methods.
  group('ContainsValidator', () {
    // Parameter(s).
    final List<String> values = ['Element1', 'Element2', 'Element3'];
    final ValueVariant<String> successParameters = ValueVariant<String>(
      {
        'Element1',
        'Element2',
        'Element3',
      },
    );

    final ValueVariant<String> errorParameters = ValueVariant<String>(
      {
        'Element4',
        'Element5',
        'Element6',
      },
    );

    testWidgets(
      'Should return true when value is found.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = successParameters.currentValue!;

        // Act.
        final bool result = ContainsValidator(
          values,
          errorText: 'errorText',
        ).isValid(parameter);

        // Assert.
        expect(result, isTrue);
      },
      variant: successParameters,
      tags: ['validator'],
    );

    testWidgets(
      'Should return false when value is not found.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = errorParameters.currentValue!;

        // Act.
        final bool result = ContainsValidator(
          values,
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
