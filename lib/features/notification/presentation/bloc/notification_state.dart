part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationLoaded extends NotificationState {
  final List<NotificationModel> notifications;
  const NotificationLoaded({required this.notifications});
}

final class NotificationCountLoaded extends NotificationState {
  final int count;
  const NotificationCountLoaded({required this.count});
}

final class NotificationError extends NotificationState {
  final String message;
  const NotificationError({required this.message});
}
