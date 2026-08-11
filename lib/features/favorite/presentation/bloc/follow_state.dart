part of 'follow_bloc.dart';

sealed class FollowState extends Equatable {
  const FollowState();
  
  @override
  List<Object> get props => [];
}

final class FollowInitial extends FollowState {}

final class FollowLoading extends FollowState {}

final class FollowLoaded extends FollowState {
  final List<SellerModel> followersList;
  const FollowLoaded(this.followersList);
  
  @override
  List<Object> get props => [followersList];
}

final class FollowError extends FollowState {
  final String message;
  const FollowError(this.message);
  
  @override
  List<Object> get props => [message];
}


