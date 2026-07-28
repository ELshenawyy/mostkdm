import 'package:equatable/equatable.dart';
import 'package:mostkdm/features/advertisement/data/models/category_ads_result.dart';

sealed class SubCategoryState extends Equatable {
  const SubCategoryState();

  @override
  List<Object?> get props => [];
}

class SubCategoryInitial extends SubCategoryState {
  const SubCategoryInitial();
}

class SubCategoryLoading extends SubCategoryState {
  const SubCategoryLoading();
}

class SubCategoryLoaded extends SubCategoryState {
  final CategoryAdsResult data;
  const SubCategoryLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class SubCategoryError extends SubCategoryState {
  final String message;
  const SubCategoryError(this.message);

  @override
  List<Object?> get props => [message];
}