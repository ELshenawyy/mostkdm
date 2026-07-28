import 'package:equatable/equatable.dart';

sealed class SubCategoryEvent extends Equatable {
  const SubCategoryEvent();

  @override
  List<Object?> get props => [];
}

class GetCategoryAdsEvent extends SubCategoryEvent {
  final int categoryId;
  final int? subCategoryId;

  const GetCategoryAdsEvent({
    required this.categoryId,
    this.subCategoryId,
  });

  @override
  List<Object?> get props => [categoryId, subCategoryId];
}