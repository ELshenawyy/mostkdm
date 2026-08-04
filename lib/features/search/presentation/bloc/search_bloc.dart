import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';
import 'package:mostkdm/features/search/data/models/city_model.dart';
import 'package:mostkdm/features/search/data/models/search_history_item.dart';
import 'package:mostkdm/features/search/data/repository/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _repository;

  List<SearchHistoryItem> _history = [];
  List<String> _trending = [];

  SearchBloc({required SearchRepository repository})
      : _repository = repository,
        super(const SearchInitial()) {
    on<SearchKeywordEvent>(_onSearch);
    on<GetSearchHistoryEvent>(_onGetSearchHistory);
    on<DeleteSearchHistoryItemEvent>(_onDeleteSearchHistoryItem);
    on<GetTopKeywordsEvent>(_onGetTopKeywords);
    on<LoadFilterOptionsEvent>(_onLoadFilterOptions);
    on<LoadSubCategoriesEvent>(_onLoadSubCategories);
    on<ApplyFilterEvent>(_onApplyFilter);
  }

  Future<void> _onSearch(
    SearchKeywordEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(const SearchLoading());
    final result = await _repository.search(
      keyword: event.keyword,
      categoryId: event.categoryId,
      subCategoryId: event.subCategoryId,
    );
    result.fold(
      (error) => emit(SearchError(error.message)),
      (ads) => emit(SearchSuccess(ads)),
    );
  }

  Future<void> _onGetSearchHistory(
    GetSearchHistoryEvent event,
    Emitter<SearchState> emit,
  ) async {
    final result = await _repository.getSearchHistory();
    result.fold(
      (error) => emit(SearchError(error.message)),
      (history) {
        _history = history;
        emit(SearchSuggestionsLoaded(history: _history, trending: _trending));
      },
    );
  }

  Future<void> _onDeleteSearchHistoryItem(
    DeleteSearchHistoryItemEvent event,
    Emitter<SearchState> emit,
  ) async {
    final previousHistory = _history;
    _history = _history.where((h) => h.id != event.id).toList();
    emit(SearchSuggestionsLoaded(history: _history, trending: _trending));

    final result = await _repository.deleteSearchHistoryById(event.id);
    result.fold(
      (error) {
        _history = previousHistory;
        emit(SearchSuggestionsLoaded(history: _history, trending: _trending));
      },
      (_) {},
    );
  }

  Future<void> _onGetTopKeywords(
    GetTopKeywordsEvent event,
    Emitter<SearchState> emit,
  ) async {
    final result = await _repository.getTopKeywords();
    result.fold(
      (error) => emit(SearchError(error.message)),
      (keywords) {
        _trending = keywords;
        emit(SearchSuggestionsLoaded(history: _history, trending: _trending));
      },
    );
  }

  // ---- Filter ----

  Future<void> _onLoadFilterOptions(
    LoadFilterOptionsEvent event,
    Emitter<SearchState> emit,
  ) async {
    final categoriesResult = await _repository.getCategories();
    final citiesResult = await _repository.getCities();

    final categories = categoriesResult.fold((_) => null, (v) => v);
    final cities = citiesResult.fold((_) => null, (v) => v);

    if (categories == null && cities == null) {
      final message = categoriesResult.fold((f) => f.message, (_) => '');
      emit(SearchError(message));
      return;
    }

    emit(FilterOptionsLoaded(
      categories: categories ?? [],
      cities: cities ?? [],
    ));
  }

  Future<void> _onLoadSubCategories(
    LoadSubCategoriesEvent event,
    Emitter<SearchState> emit,
  ) async {
    final result = await _repository.getSubCategories(event.categoryId);
    result.fold(
      (error) => emit(SearchError(error.message)),
      (subCategories) => emit(SubCategoriesLoaded(subCategories)),
    );
  }

  Future<void> _onApplyFilter(
    ApplyFilterEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(const SearchLoading());
    final result = await _repository.filterAds(
      categoryId: event.categoryId,
      subCategoryId: event.subCategoryId,
      cityId: event.cityId,
      isFeatured: event.isFeatured,
      priceFrom: event.priceFrom,
      priceTo: event.priceTo,
    );
    result.fold(
      (error) => emit(SearchError(error.message)),
      (ads) => emit(SearchSuccess(ads)),
    );
  }
}
