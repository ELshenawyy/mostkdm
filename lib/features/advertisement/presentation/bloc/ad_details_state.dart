part of 'ad_details_bloc.dart';

sealed class AdDetailsState extends Equatable {
  const AdDetailsState();

  @override
  List<Object> get props => [];
}

final class AdDetailsInitial extends AdDetailsState {}

final class AdDetailsLoading extends AdDetailsState {}

final class AdDetailsLoaded extends AdDetailsState {
  final AdDetailsModel adDetailsModel;
  const AdDetailsLoaded(this.adDetailsModel);

  @override
  List<Object> get props => [adDetailsModel];
}

final class AdDetailsError extends AdDetailsState {
  final String message;
  const AdDetailsError(this.message);

  @override
  List<Object> get props => [message];
}
