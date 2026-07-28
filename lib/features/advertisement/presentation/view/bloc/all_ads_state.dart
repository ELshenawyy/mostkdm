import 'package:equatable/equatable.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';

sealed class AdsListState extends Equatable {
  const AdsListState();

  @override
  List<Object?> get props => [];
}

class AdsListInitial extends AdsListState {
  const AdsListInitial();
}

class AdsListLoading extends AdsListState {
  const AdsListLoading();
}

class AdsListLoaded extends AdsListState {
  final List<AdModel> ads;
  const AdsListLoaded(this.ads);

  @override
  List<Object?> get props => [ads];
}

class AdsListError extends AdsListState {
  final String message;
  const AdsListError(this.message);

  @override
  List<Object?> get props => [message];
}
