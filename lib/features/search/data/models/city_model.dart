class CityModel {
  final int id;
  final String name;
  final bool isActive;

  const CityModel({
    required this.id,
    required this.name,
    required this.isActive,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] is int
          ? json['id']
          : (int.tryParse(json['id']?.toString() ?? '') ?? 0),
      name: json['name']?.toString() ?? '',
      isActive: json['is_active'] is bool ? json['is_active'] : true,
    );
  }
}