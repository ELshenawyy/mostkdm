part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchSuccess extends SearchState {
  final List<AdModel> ads;
  const SearchSuccess(this.ads);

  @override
  List<Object?> get props => [ads];
}

/// Combined "before typing" state -- recent searches + trending
/// keywords together, since the design shows both at once. The Bloc
/// keeps its own copy of whichever arrived last (history or trending)
/// and re-emits this combined state every time either one updates.
class SearchSuggestionsLoaded extends SearchState {
  final List<SearchHistoryItem> history;
  final List<String> trending;

  const SearchSuggestionsLoaded({
    required this.history,
    required this.trending,
  });

  @override
  List<Object?> get props => [history, trending];
}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);

  @override
  List<Object?> get props => [message];
}

// ---- Filter ----
// NOTE: these two only matter to FilterBottomSheet, but since Filter
// lives inside the same SearchBloc, every BlocBuilder<SearchBloc,
// SearchState> in the app -- including the main search body -- has to
// be able to receive them. The main body uses `buildWhen` to ignore
// them so it doesn't flicker/reset when the filter sheet loads its
// dropdown data.

class FilterOptionsLoaded extends SearchState {
  final List<CategoryModel> categories;
  final List<CityModel> cities;

  const FilterOptionsLoaded({
    required this.categories,
    required this.cities,
  });

  @override
  List<Object?> get props => [categories, cities];
}

class SubCategoriesLoaded extends SearchState {
  final List<CategoryModel> subCategories;
  const SubCategoriesLoaded(this.subCategories);

  @override
  List<Object?> get props => [subCategories];
}