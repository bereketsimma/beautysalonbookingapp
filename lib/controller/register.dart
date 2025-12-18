// // controllers/signup_controller.dart
// import 'package:flutter/material.dart';
// import '../services/api_service.dart';

// class SignUpController {
//   bool _loading = false;
//   String? _errorMessage;

//   bool get loading => _loading;
//   String? get errorMessage => _errorMessage;

//   // The function now accepts TextEditingController values from UI
//   Future<Map<String, dynamic>> registerUser({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     _loading = true;
//     _errorMessage = null;

//     final result = await ApiService.registerUser(
//       username: name,
//       email: email,
//       password: password,
//     );

//     _loading = false;

//     if (!result['success']) {
//       _errorMessage = result['message'];
//     }

//     return result;
//   }
// }


