
import 'package:equatable/equatable.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class GetFavoritesEvent extends FavoriteEvent {}

class ToggleFavoriteAdEvent extends FavoriteEvent {
  final int adId;
  final AdModel? adItem;

  const ToggleFavoriteAdEvent({
    required this.adId,
    this.adItem,
  });

  @override
  List<Object> get props => [adId, if (adItem != null) adItem!];
}