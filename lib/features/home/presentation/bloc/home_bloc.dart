import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/home/data/datasource/home_remote_data_source.dart';
import 'package:mostkdm/features/home/data/models/ads_model.dart';

import 'package:mostkdm/features/home/data/models/home_model.dart';
import 'package:mostkdm/features/home/data/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc()
      : _repository = HomeRepositoryImpl(HomeRemoteDataSourceImpl()),
        super(const HomeInitial()) {
    on<GetHomeEvent>(_onGetHome);
    on<SearchEvent>(_onSearch);
    on<GetSearchHistoryEvent>(_onGetSearchHistory);
    on<DeleteSearchHistoryEvent>(_onDeleteSearchHistory);
    on<GetTopKeywordsEvent>(_onGetTopKeywords);
  }

  Future<void> _onGetHome(
    GetHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());
    final result = await _repository.getHome();
    result.fold(
      (error) => emit(HomeError(error.message)),
      (home) => emit(HomeSuccess(home)),
    );
  }

  Future<void> _onSearch(
    SearchEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const SearchLoading());
    final result = await _repository.search(keyword: event.keyword);
    result.fold(
      (error) => emit(HomeError(error.message)),
      (ads) => emit(SearchSuccess(ads)),
    );
  }

  Future<void> _onGetSearchHistory(
    GetSearchHistoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await _repository.getSearchHistory();
    result.fold(
      (error) => emit(HomeError(error.message)),
      (history) => emit(SearchHistorySuccess(history)),
    );
  }

  Future<void> _onDeleteSearchHistory(
    DeleteSearchHistoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await _repository.deleteSearchHistory(id: event.id);
    result.fold(
      (error) => emit(HomeError(error.message)),
      (_) => add(const GetSearchHistoryEvent()),
    );
  }

  Future<void> _onGetTopKeywords(
    GetTopKeywordsEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await _repository.getTopKeywords();
    result.fold(
      (error) => emit(HomeError(error.message)),
      (keywords) => emit(TopKeywordsSuccess(keywords)),
    );
  }
}
