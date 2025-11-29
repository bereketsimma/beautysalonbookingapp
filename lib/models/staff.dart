class Staff {
  final int id;
  final String name;
  final String specialization;
  final String phone;

  Staff({required this.id, required this.name, required this.specialization, required this.phone});

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
      phone: json['phone'],
    );
  }
}
