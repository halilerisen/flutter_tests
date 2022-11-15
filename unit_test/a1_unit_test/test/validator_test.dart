import 'package:a1_unit_test/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Validator - ',
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
}
