part of 'add_ad_bloc.dart';

sealed class AddAdEvent extends Equatable {
  const AddAdEvent();

  @override
  List<Object?> get props => [];
}

/// بيتنادى مرة واحدة لما AddAdView تفتح في وضع التعديل، بعد ما
/// AdDetailsBloc يجيب بيانات الإعلان.
class PrefillFromAdEvent extends AddAdEvent {
  final int adId;
  final AdDetailsModel ad;

  const PrefillFromAdEvent({required this.adId, required this.ad});

  @override
  List<Object?> get props => [adId, ad];
}

class UpdateBasicInfoEvent extends AddAdEvent {
  final String title;
  final String description;
  final String price;

  const UpdateBasicInfoEvent({
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [title, description, price];
}

class UpdateCategoryEvent extends AddAdEvent {
  final int categoryId;
  final int? subCategoryId;

  const UpdateCategoryEvent({required this.categoryId, this.subCategoryId});

  @override
  List<Object?> get props => [categoryId, subCategoryId];
}

class UpdateLocationEvent extends AddAdEvent {
  final String location;
  final double? latitude;
  final double? longitude;
  final int? cityId;

  const UpdateLocationEvent({
    required this.location,
    this.latitude,
    this.longitude,
    this.cityId,
  });

  @override
  List<Object?> get props => [location, latitude, longitude, cityId];
}

class AddImageEvent extends AddAdEvent {
  final String path;
  const AddImageEvent(this.path);

  @override
  List<Object?> get props => [path];
}

class RemoveImageEvent extends AddAdEvent {
  final int index;
  const RemoveImageEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class UpdateContactEvent extends AddAdEvent {
  final String connectionType;
  final String connectionNumber;

  const UpdateContactEvent({
    required this.connectionType,
    required this.connectionNumber,
  });

  @override
  List<Object?> get props => [connectionType, connectionNumber];
}

class SubmitAdEvent extends AddAdEvent {
  const SubmitAdEvent();
}

/// بتنادى مرة واحدة لما CategoryLocationSection تفتح -- تجيب الأقسام
/// الرئيسية والمدن مع بعض.
class LoadLookupDataEvent extends AddAdEvent {
  const LoadLookupDataEvent();
}

/// بتنادى لما المستخدم يختار قسم رئيسي -- تجيب أقسامه الفرعية.
class LoadSubCategoriesForCategoryEvent extends AddAdEvent {
  final int categoryId;
  const LoadSubCategoriesForCategoryEvent(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}