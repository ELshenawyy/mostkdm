part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchKeywordEvent extends SearchEvent {
  final String keyword;
  final int? categoryId;
  final int? subCategoryId;

  const SearchKeywordEvent({
    required this.keyword,
    this.categoryId,
    this.subCategoryId,
  });

  @override
  List<Object?> get props => [keyword, categoryId, subCategoryId];
}

class GetSearchHistoryEvent extends SearchEvent {
  const GetSearchHistoryEvent();
}

class DeleteSearchHistoryItemEvent extends SearchEvent {
  final int id;

  const DeleteSearchHistoryItemEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetTopKeywordsEvent extends SearchEvent {
  const GetTopKeywordsEvent();
}

// ---- Filter ----

/// Fired when the filter bottom sheet opens -- loads the main
/// categories + cities dropdowns.
class LoadFilterOptionsEvent extends SearchEvent {
  const LoadFilterOptionsEvent();
}

/// Fired when the user picks a main category -- loads that category's
/// sub-categories for the second dropdown.
class LoadSubCategoriesEvent extends SearchEvent {
  final int categoryId;
  const LoadSubCategoriesEvent(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}

/// Fired on "أظهر النتائج" -- applies the selected filters via
/// GET /ads/filter and shows the results the same way a keyword search
/// would.
class ApplyFilterEvent extends SearchEvent {
  final int? categoryId;
  final int? subCategoryId;
  final int? cityId;
  final bool? isFeatured;
  final double? priceFrom;
  final double? priceTo;

  const ApplyFilterEvent({
    this.categoryId,
    this.subCategoryId,
    this.cityId,
    this.isFeatured,
    this.priceFrom,
    this.priceTo,
  });

  @override
  List<Object?> get props =>
      [categoryId, subCategoryId, cityId, isFeatured, priceFrom, priceTo];
}