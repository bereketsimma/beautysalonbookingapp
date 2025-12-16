// controllers/login_controller.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginController {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("https://your-backend.com/api/login/"),
        body: {'email': email, 'password': password},
      );
      return jsonDecode(response.body);
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }
}
