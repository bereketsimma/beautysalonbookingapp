// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mybeautybooking_flutter/constants/api_constants.dart';
class ApiService {
  static Future<void> registerUser(String username, String email, String password) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/api/register/');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      print('User registered successfully!');
    } else {
      final data = jsonDecode(response.body);
      print('Error: ${data['error'] ?? 'Unknown error'}');
    }
  }
}
