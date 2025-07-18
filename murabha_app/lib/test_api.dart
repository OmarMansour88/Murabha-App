import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> getCustomerFromNode(String id) async {
  // Replace with your machine’s IP if testing on real phone
  const String baseUrl = 'http://localhost:3000';

  final String url = '$baseUrl/customer/$id';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Customer from Node.js: $data');
    } else {
      print('Failed to fetch. Status: ${response.statusCode}');
      print('Failed to fetch. Status: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

// void main() {
//   getCustomerFromNode("100005");
//   // print();
// }
