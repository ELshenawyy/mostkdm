part of 'add_ad_bloc.dart';

enum AddAdSubmissionStatus { idle, submitting, success, failure }

/// State واحدة مسطّحة بتجمع بيانات الخطوات الخمسة كلها -- مش sealed،
/// لأن الفكرة هنا "فورم بيتعبى تدريجيًا"، مش تدفق حالات متتالية.
class AddAdState extends Equatable {
  final int? editingAdId; // null = إضافة إعلان جديد

  final String title;
  final String description;
  final String price;

  final int? categoryId;
  final int? subCategoryId;

  final int? cityId;
  final String location;
  final double? latitude;
  final double? longitude;

  final String connectionType;
  final String connectionNumber;

  final List<String> localImagePaths; // صور جديدة مختارة من الجهاز
  final List<String> existingImageUrls; // صور الإعلان القديمة (وضع التعديل)

  // بيانات الـ dropdowns (جاية من LookupRepository)
  final List<CategoryModel> categories;
  final List<CategoryModel> subCategories;
  final List<CityModel> cities;

  final AddAdSubmissionStatus submissionStatus;
  final String? errorMessage;

  const AddAdState({
    this.editingAdId,
    this.title = '',
    this.description = '',
    this.price = '',
    this.categoryId,
    this.subCategoryId,
    this.cityId,
    this.location = '',
    this.latitude,
    this.longitude,
    this.connectionType = '',
    this.connectionNumber = '',
    this.localImagePaths = const [],
    this.existingImageUrls = const [],
    this.categories = const [],
    this.subCategories = const [],
    this.cities = const [],
    this.submissionStatus = AddAdSubmissionStatus.idle,
    this.errorMessage,
  });

  AddAdState copyWith({
    int? editingAdId,
    String? title,
    String? description,
    String? price,
    int? categoryId,
    int? subCategoryId,
    int? cityId,
    String? location,
    double? latitude,
    double? longitude,
    String? connectionType,
    String? connectionNumber,
    List<String>? localImagePaths,
    List<String>? existingImageUrls,
    List<CategoryModel>? categories,
    List<CategoryModel>? subCategories,
    List<CityModel>? cities,
    AddAdSubmissionStatus? submissionStatus,
    String? errorMessage,
  }) {
    return AddAdState(
      editingAdId: editingAdId ?? this.editingAdId,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      cityId: cityId ?? this.cityId,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      connectionType: connectionType ?? this.connectionType,
      connectionNumber: connectionNumber ?? this.connectionNumber,
      localImagePaths: localImagePaths ?? this.localImagePaths,
      existingImageUrls: existingImageUrls ?? this.existingImageUrls,
      categories: categories ?? this.categories,
      subCategories: subCategories ?? this.subCategories,
      cities: cities ?? this.cities,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        editingAdId,
        title,
        description,
        price,
        categoryId,
        subCategoryId,
        cityId,
        location,
        latitude,
        longitude,
        connectionType,
        connectionNumber,
        localImagePaths,
        existingImageUrls,
        categories,
        subCategories,
        cities,
        submissionStatus,
        errorMessage,
      ];
}