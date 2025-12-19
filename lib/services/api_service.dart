import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mybeautybooking_flutter/constants/api_constants.dart';
import 'package:mybeautybooking_flutter/models/service.dart';
import 'package:mybeautybooking_flutter/models/staff.dart';

Future<Map<String, dynamic>> signupAptRequest(
  SignUpRequest request,
) async {
  final url = Uri.parse('${ApiConstants.baseUrl}/api/register/');

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    print('STATUS: ${response.statusCode}');
    print('BODY: ${response.body}');

    final data = jsonDecode(response.body);

    if (response.statusCode == 201 || response.statusCode == 200) {
      return {
        'success': true,
        'message': data['message'] ?? 'User registered successfully',
        'data': data,
      };
    } else {
      return {
        'success': false,
        'message': data['error'] ?? 'Registration failed',
      };
    }
  } catch (e) {
    print('NETWORK ERROR: $e');

    return {
      'success': false,
      'message': 'Failed to connect to server',
    };
  }
}

Future<Map<String, dynamic>> loginAptRequest(
  LoginRequest request,
) async {
  final url = Uri.parse('${ApiConstants.baseUrl}/api/login/');

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    print('STATUS: ${response.statusCode}');
    print('BODY: ${response.body}');

    final data = jsonDecode(response.body);

    if (response.statusCode == 201 || response.statusCode == 200) {
      return {
        'success': true,
        'message': data['message'] ?? 'User registered successfully',
        'data': data,
      };
    } else {
      return {
        'success': false,
        'message': data['error'] ?? 'Registration failed',
      };
    }
  } catch (e) {
    print('NETWORK ERROR: $e');

    return {
      'success': false,
      'message': 'Failed to connect to server',
    };
  }
}

Future<List<Staff>> fetchStaffs() async {
  final url = Uri.parse('${ApiConstants.baseUrl}/api/staff/');

  try {
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Staff.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load staffs (${response.statusCode})');
    }
  } catch (e, stackTrace) {
    print("Error fetching staffs: $e");
    print(stackTrace); // optional: shows where the error happened
    throw Exception('Network error: $e');
  }
}

Future<List<Staff>> fetchservicess() async {
  final url = Uri.parse('${ApiConstants.baseUrl}/api/services/');

  try {
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Staff.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load staffs');
    }
  } catch (e) {
    throw Exception('Network error: $e');
  }
}

Future<List<Staff>> fetchappointments() async {
  final url = Uri.parse('${ApiConstants.baseUrl}/api/appointments/');

  try {
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Staff.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load staffs');
    }
  } catch (e) {
    throw Exception('Network error: $e');
  } finally {
    // TODO: implement finally
  }
}
