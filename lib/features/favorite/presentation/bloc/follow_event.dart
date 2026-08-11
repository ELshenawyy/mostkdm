part of 'follow_bloc.dart';

sealed class FollowEvent extends Equatable {
  const FollowEvent();

  @override
  List<Object> get props => [];
}

class GetFollowersEvent extends FollowEvent {
  const GetFollowersEvent();
}

class ToggleFollowEvent extends FollowEvent {
  final int userId;
  const ToggleFollowEvent({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}
