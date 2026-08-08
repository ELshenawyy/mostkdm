part of 'notification_bloc.dart';

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class GetNotificationsEvent extends NotificationEvent {}

class GetUnreadNotificationsCountEvent extends NotificationEvent {}

class MarkAllNotificationsAsReadEvent extends NotificationEvent {}

class DeleteNotificationEvent extends NotificationEvent {
  final String notificationId;
  const DeleteNotificationEvent({required this.notificationId});

  @override
  List<Object> get props => [notificationId];
}

class DeleteAllNotificationsEvent extends NotificationEvent {}