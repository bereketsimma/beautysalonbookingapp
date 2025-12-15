// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mybeautybooking_flutter/constants/api_constants.dart';

class ApiService {
  /// Registers a new user.
  /// Returns a map with keys: "success" (bool) and "message" (String)
  static Future<Map<String, dynamic>> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/api/register/');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username.trim(),
          'email': email.trim(),
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 201) {
        return {
          'success': true,
          'message': data['message'] ?? 'User registered successfully'
        };
      } else {
        return {
          'success': false,
          'message': data['error'] ?? 'Unknown error occurred'
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Failed to connect to server. Please try again.'
      };
    }
  }
}
