import 'package:a1_unit_test/maths_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test sum function', () {
    // Arrange
    const int a = 10;
    const int b = 5;

    // Act
    final sumResult = sum(a: a, b: b);

    // Assert
    expect(sumResult, 15);
  });
}
