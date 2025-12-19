class SignUpRequest {
  final String name;
  final String email;
  final String password;

  SignUpRequest({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': name,
      'email': email,
      'password': password,
    };
  }
}

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}


class Service {
  final int? id;
  final String name;
  final String? description;
  final String? image;

  Service({
    this.id,
    required this.name,
    this.description,
    this.image,
  });

  // Factory constructor to create a Service from JSON
  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      name: json['name'] ?? 'No Name',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
    );
  }

  // Convert Service object to JSON (optional, for sending data)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
