part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeSuccess extends HomeState {
  final HomeModel home;
  const HomeSuccess(this.home);

  @override
  List<Object> get props => [home];
}

class SearchLoading extends HomeState {
  const SearchLoading();
}

class SearchSuccess extends HomeState {
  final List<AdModel> ads;
  const SearchSuccess(this.ads);

  @override
  List<Object> get props => [ads];
}

class SearchHistorySuccess extends HomeState {
  final List<String> history;
  const SearchHistorySuccess(this.history);

  @override
  List<Object> get props => [history];
}

class TopKeywordsSuccess extends HomeState {
  final List<String> keywords;
  const TopKeywordsSuccess(this.keywords);

  @override
  List<Object> get props => [keywords];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
