import 'package:a1_unit_test/maths_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Maths Util - ',
    () {
      // Arrange
      const int a = 10;
      const int b = 5;

      test('Test sum function', () {
        // Act
        final sumResult = sum(a: a, b: b);

        // Assert
        expect(sumResult, 15);
      });

      test('Test subtract function', () {
        // Act
        final sumResult = subtract(a: a, b: b);

        // Assert
        expect(sumResult, 5);
      });

      test('Test multiply function', () {
        // Act
        final sumResult = multiply(a: a, b: b);

        // Assert
        expect(sumResult, 50);
      });
    },
  );
}
