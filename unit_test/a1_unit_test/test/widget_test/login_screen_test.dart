import 'package:a1_unit_test/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Should have a title',
    (WidgetTester widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // ACT
      Finder title = find.text('Login');

      // Assert
      expect(title, findsOneWidget);
    },
  );

  testWidgets(
    'Should have one text field form to collect user email_id',
    (WidgetTester widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // ACT
      Finder userNameTextField = find.byKey(const ValueKey('email_id'));

      // Assert
      expect(userNameTextField, findsOneWidget);
    },
  );

  testWidgets(
    'Should have one text field form to collect Password',
    (WidgetTester widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // ACT
      Finder passwordTextField = find.byKey(const ValueKey('password'));

      // Assert
      expect(passwordTextField, findsOneWidget);
    },
  );

  testWidgets(
    'Should have one login button',
    (WidgetTester widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // ACT
      Finder passwordTextField = find.byType(ElevatedButton);

      // Assert
      expect(passwordTextField, findsOneWidget);
    },
  );

  testWidgets(
    'Should show Required Fields error message if user email id & password is empty',
    (WidgetTester widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder loginButton = find.byType(ElevatedButton);
      await widgetTester.tap(loginButton);
      //? Update UI
      await widgetTester.pumpAndSettle();
      Finder errorText = find.text("Required Field");

      // Assert
      expect(errorText, findsNWidgets(2));
    },
  );

  testWidgets(
    'Should submit form when user email id & password is valid',
    (WidgetTester widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder userNameTextField = find.byKey(const ValueKey('email_id'));
      Finder passwordTextField = find.byKey(const ValueKey('password'));
      await widgetTester.enterText(userNameTextField, 'abc@example.com');
      await widgetTester.enterText(passwordTextField, 'password');

      Finder loginButton = find.byType(ElevatedButton);
      await widgetTester.tap(loginButton);
      //? Update UI
      await widgetTester.pumpAndSettle();
      Finder errorText = find.text("Required Field");

      // Assert
      expect(errorText, findsNothing);
    },
  );
}
