import 'package:a1_unit_test/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group(
    'Login Flow',
    () {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      testWidgets(
        'Should show required fields error message when user taps on login button without entering email id  & password ',
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
          await widgetTester.pumpAndSettle();

          Finder errorText = find.text('Required Field');

          // Assert
          expect(errorText, findsAtLeastNWidgets(2));
        },
      );

      testWidgets(
        'Should show home screen when user taps on login button after entering valid email id & password ',
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
          await widgetTester.pumpAndSettle();

          Finder welcomeText = find.byType(Text);

          // Assert
          expect(welcomeText, findsOneWidget);
        },
      );
    },
  );
}
