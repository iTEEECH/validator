import 'package:flutter_test/flutter_test.dart';
import 'package:validator/validator.dart';

void main() {
  // Prerequisite(s).

  // Initialization mock(s) and instance(s).
  setUpAll(() {});

  // Dispose mock(s) and instance(s).
  tearDownAll(() {});

  // Group tests by methods.
  group('EmailValidator', () {
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
        'firstname.firstname@',
        'firstname_lastName@email.',
      },
    );

    testWidgets(
      'Should return true when email is valid.',
      (WidgetTester tester) async {
        // Arrange.
        final String parameter = successParameters.currentValue!;

        // Act.
        final bool result = EmailValidator(errorText: 'errorText').isValid(parameter);

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
        final bool result = EmailValidator(errorText: 'errorText').isValid(parameter);

        // Assert.
        expect(result, isFalse);
      },
      variant: errorParameters,
      tags: ['validator'],
    );
  });
}
