import 'package:flutter_test/flutter_test.dart';
import 'package:validator/validator.dart';

void main() {
  // Prerequisite(s).

  // Initialization mock(s) and instance(s).
  setUpAll(() {});

  // Dispose mock(s) and instance(s).
  tearDownAll(() {});

  // Group tests by methods.
  group('MultiValidator', () {
    // Parameter(s).
    final ValueVariant<String> successParameters = ValueVariant<String>(
      {
        'firstname@email.com',
        'firstname.lastname@email.com',
        'firstname_lastname@email.com',
      },
    );
    final ValueVariant<String> errorParameters = ValueVariant<String>(
      {
        'firstname',
        'firstname.lastname@',
        'firstname_lastname@email.',
      },
    );

    testWidgets(
      'Should return true when at least one value is correct.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = successParameters.currentValue!;

        // Act.
        final bool result = MultiValidator<String>(
          [
            RequiredValidator(errorText: 'errorText'),
            EmailValidator(errorText: 'errorText'),
          ],
          isAllRequired: false,
        ).isValid(parameter);

        // Assert.
        expect(result, isTrue);
      },
      variant: successParameters,
      tags: ['validator'],
    );

    testWidgets(
      'Should return false when all values are incorrect.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = errorParameters.currentValue!;

        // Act.
        final bool result = MultiValidator<String>(
          [
            RequiredValidator(errorText: 'errorText'),
            EmailValidator(errorText: 'errorText'),
          ],
        ).isValid(parameter);

        // Assert.
        expect(result, isFalse);
      },
      variant: errorParameters,
      tags: ['validator'],
    );
  });
}
