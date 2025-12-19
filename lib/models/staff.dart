class Staff {
  final int? id;
  final String username;
  final List<int> services; // List of service IDs
  final String? phone;
  final String? description;
  final String? image;
  final double? averageRating;

  Staff({
    this.id,
    required this.username,
    required this.services,
    this.phone,
    this.description,
    this.image,
    this.averageRating,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) : null,
      username: json['username'] ?? 'No Name',
      services: json['services'] != null
          ? List<int>.from(json['services'].map((s) => s['id'] as int))
          : [],
      phone: json['phone'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      averageRating: json['average_rating'] != null
          ? (json['average_rating'] as num).toDouble()
          : null,
    );
  }
}
