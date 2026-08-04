part of 'my_ads_bloc.dart';

sealed class MyAdsState extends Equatable {
  const MyAdsState();

  @override
  List<Object> get props => [];
}

final class MyAdsInitial extends MyAdsState {
  const MyAdsInitial();
}

final class MyAdsLoading extends MyAdsState {
  const MyAdsLoading();
}

final class MyAdsLoaded extends MyAdsState {
  final List<AdModel> ads;
  const MyAdsLoaded(this.ads);

  @override
  List<Object> get props => [ads];
}

final class MyAdsError extends MyAdsState {
  final String message;
  const MyAdsError(this.message);

  @override
  List<Object> get props => [message];
}
