
import 'package:equatable/equatable.dart';

sealed class AdsListEvent extends Equatable {
  const AdsListEvent();

  @override
  List<Object?> get props => [];
}

class GetAllAdsEvent extends AdsListEvent {
  const GetAllAdsEvent();
}