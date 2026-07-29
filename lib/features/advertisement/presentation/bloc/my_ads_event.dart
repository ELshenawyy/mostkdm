part of 'my_ads_bloc.dart';

sealed class MyAdsEvent extends Equatable {
  const MyAdsEvent();

  @override
  List<Object> get props => [];
}

class GetMyAdsEvent extends MyAdsEvent {
  const GetMyAdsEvent();
}

class ToggleMyAdActiveEvent extends MyAdsEvent {
  final int adId;
  const ToggleMyAdActiveEvent({required this.adId});
}

class DeleteMyAdEvent extends MyAdsEvent {
  final int adId;
  const DeleteMyAdEvent({required this.adId});
}
