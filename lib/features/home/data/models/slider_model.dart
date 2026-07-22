class SliderModel {
  final int id;
  final String name;
  final String? description;
  final String image;

  const SliderModel({
    required this.id,
    required this.name,
    this.description,
    required this.image,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }
}