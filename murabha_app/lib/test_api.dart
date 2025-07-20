import 'package:dio/dio.dart';

Future<void> fetchCustomer(String id) async {
  final dio = Dio();
  const String baseUrl = 'http://localhost:3000';
  final String url = '$baseUrl/customer';
  try {
    final response = await dio.get(
      url,
      queryParameters: {"accountId": id}, // Replace with your endpoint
    );

    if (response.statusCode == 200) {
      print('Success: ${response.data}');
    } else {
      print('Failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

void main() {
  fetchCustomer("2312313");
}
