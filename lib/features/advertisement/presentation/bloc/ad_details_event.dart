part of 'ad_details_bloc.dart';

sealed class AdDetailsEvent extends Equatable {
  const AdDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetAdDetailsEvent extends AdDetailsEvent {
  final String adId;
  const GetAdDetailsEvent({required this.adId});

  @override
  List<Object> get props => [adId];
}




