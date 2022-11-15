# Flutter Test Rules

1. `flutter test`
    Test bloklarını çalıştırır.
2. Test için yazılan bütün dosyalar `*_test.dart` gibi isimlendirilmelidir.
3. `Integration Test` için `dev_dependencies` altına `integration_test` paketini eklemeliyiz.
    ```dart
    dev_dependencies:
      integration_test:
        sdk: flutter
    ```
4. `Integration Test` için ana dizine `integration_test` dosyasını eklemeliyiz. Ve yazacağımız testler bu dosya altına eklenmelidir. `test` dosyası altına `Integration Test` yazılmaz..!!
5. `Integration Test` `Widget Test` e benzer şekilde yazılır.
    ```dart
      group(
        'Login Flow',
        () {
          //! Dikkat
          IntegrationTestWidgetsFlutterBinding.ensureInitialized();

          testWidgets(
            '...',
            (WidgetTester widgetTester) async {
              // Arrange

              // Act

              // Assert
            },
          );
      }
    ```