import 'package:a1_unit_test/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Validator - Email',
    () {
      test('validate for empty email id', () {
        // Arrange & Act
        String? result = Validator.validateEmail(email: '');

        // Assert
        expect(result, 'Required Field');
      });

      test('validate for invalid email id', () {
        // Arrange & Act
        String? result = Validator.validateEmail(email: 'invalid email');

        // Assert
        expect(result, 'Please enter a valid email id');
      });

      test('validate for valid email id', () {
        // Arrange & Act
        String? result = Validator.validateEmail(email: 'abc@example.com');

        // Assert
        expect(result, null);
      });
    },
  );

  group(
    'Validator - Password',
    () {
      test('validate for empty password id', () {
        // Arrange & Act
        String? result = Validator.validatePassword(password: '');

        // Assert
        expect(result, 'Required Field');
      });

      test('validate for invalid password id', () {
        // Arrange & Act
        String? result = Validator.validatePassword(password: 'pass');

        // Assert
        expect(result, 'Please enter at least 8 character for password');
      });

      test('validate for valid password id', () {
        // Arrange & Act
        String? result = Validator.validatePassword(password: 'password');

        // Assert
        expect(result, null);
      });
    },
  );
}
