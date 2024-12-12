```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
    } else {
      // Handle specific HTTP error codes
      if (response.statusCode == 404) {
        throw Exception('Resource not found');
      } else if (response.statusCode == 500) {
        throw Exception('Server error');
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    }
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('Invalid JSON format: $e');
  } on SocketException catch (e) {
    // Handle network errors
    print('Network error: Could not connect to the server.');
  } catch (e) {
    print('An unexpected error occurred.'); // Generic user-friendly message
  }
}
```