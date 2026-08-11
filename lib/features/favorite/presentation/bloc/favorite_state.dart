import 'package:equatable/equatable.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<AdModel> favoriteAds;

  const FavoriteLoaded(this.favoriteAds);

  @override
  List<Object> get props => [favoriteAds];
}

final class FavoriteError extends FavoriteState {
  final String message;
  const FavoriteError(this.message);

  @override
  List<Object> get props => [message];
}
