class PackageFeatureModel {
  final String title;
  final String description;
  final bool isIncluded;

  const PackageFeatureModel({
    required this.title,
    required this.description,
    required this.isIncluded,
  });

  factory PackageFeatureModel.fromJson(Map<String, dynamic> json) {
    return PackageFeatureModel(
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      isIncluded: json['is_included'] is bool
          ? json['is_included']
          : (json['is_included']?.toString() == 'true' || json['is_included'] == 1),
    );
  }
}