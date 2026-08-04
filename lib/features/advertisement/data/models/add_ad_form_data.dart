import 'package:dio/dio.dart';
class AddAdFormData {
  final String title;
  final String description;
  final String price;
  final int categoryId;
  final int? subCategoryId;
  final int? cityId;
  final String location;
  final double? latitude;
  final double? longitude;
  final String connectionType;
  final String connectionNumber;
  final List<String> localImagePaths;

  const AddAdFormData({
    required this.title,
    required this.description,
    required this.price,
    required this.categoryId,
    this.subCategoryId,
    this.cityId,
    required this.location,
    this.latitude,
    this.longitude,
    required this.connectionType,
    required this.connectionNumber,
    this.localImagePaths = const [],
  });

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'title': title,
      'description': description,
      'price': price,
      'category_id': categoryId.toString(),
      if (subCategoryId != null) 'sub_category_id': subCategoryId.toString(),
      if (cityId != null) 'city_id': cityId.toString(),
      'location': location,
      if (latitude != null) 'latitude': latitude.toString(),
      if (longitude != null) 'longitude': longitude.toString(),
      'conection_type': connectionType,
      'conection_number': connectionNumber,
      'images[]': await Future.wait(
        localImagePaths.map((path) => MultipartFile.fromFile(path)),
      ),
    });
  }
}