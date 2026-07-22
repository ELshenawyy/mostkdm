part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetHomeEvent extends HomeEvent {
  const GetHomeEvent();
}

class SearchEvent extends HomeEvent {
  final String keyword;
  const SearchEvent(this.keyword);

  @override
  List<Object> get props => [keyword];
}

class GetSearchHistoryEvent extends HomeEvent {
  const GetSearchHistoryEvent();
}

class DeleteSearchHistoryEvent extends HomeEvent {
  final int id;
  const DeleteSearchHistoryEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetTopKeywordsEvent extends HomeEvent {
  const GetTopKeywordsEvent();
}