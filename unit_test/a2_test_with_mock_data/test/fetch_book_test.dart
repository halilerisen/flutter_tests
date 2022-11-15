import 'package:a2_test_with_mock_data/fetch_books.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_book_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group(
    'Fetch books API call test',
    () {
      test(
        'Should return list of books for http success call',
        () async {
          // Arrange
          final mockClient = MockClient();
          when(mockClient.get(Uri.parse(fetchBooksURL)))
              .thenAnswer((realInvocation) async => http.Response('[{"name": "The 5 second rule", "auther": "Mel Robbins" }]', 200));

          // Act & Assert
          expect(await fetchBooks(mockClient), isA<List<BooksListModel>>());
        },
      );

      test(
        'Should throw an exception when  http api call finished with an error',
        () async {
          // Arrange
          final mockClient = MockClient();
          when(mockClient.get(Uri.parse(fetchBooksURL)))
              .thenAnswer((realInvocation) async => http.Response('Not Found', 404));

          // Act & Assert
          expect(fetchBooks(mockClient), throwsException);
        },
      );
    },
  );
}
