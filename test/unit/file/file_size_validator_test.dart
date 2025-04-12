import 'package:flutter_test/flutter_test.dart';
import 'package:validator/validator.dart';

void main() {
  // Prerequisite(s).

  // Initialization mock(s) and instance(s).
  setUpAll(() {});

  // Dispose mock(s) and instance(s).
  tearDownAll(() {});

  // Group tests by methods.
  group('FileSizeValidator', () {
    // Parameter(s).
    final int maxSize = 5;
    final ValueVariant<int> successParameters = ValueVariant<int>(
      {
        1000000,
        2500000,
        5000000,
      },
    );

    final ValueVariant<int> errorParameters = ValueVariant<int>(
      {
        5250000,
        7500000,
        10000000,
      },
    );

    testWidgets(
      'Should return true when file size is valid.',
      (WidgetTester tester) async {
        // Arrange.
        final int parameter = successParameters.currentValue!;

        // Act.
        final bool result = FileSizeValidator(
          maxSize,
          errorText: 'errorText',
        ).isValid(parameter);

        // Assert.
        expect(result, isTrue);
      },
      variant: successParameters,
      tags: ['validator'],
    );

    testWidgets(
      'Should return false when file size is wrong.',
      (WidgetTester tester) async {
        // Arrange.
        final int parameter = errorParameters.currentValue!;

        // Act.
        final bool result = FileSizeValidator(
          maxSize,
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
