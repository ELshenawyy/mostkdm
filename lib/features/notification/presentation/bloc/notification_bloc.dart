import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mostkdm/features/notification/data/models/notification_model.dart';
import 'package:mostkdm/features/notification/data/repository/notification_repository.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository _repository;
  NotificationBloc({required NotificationRepository repository})
      : _repository = repository,
        super(NotificationInitial()) {
    on<GetNotificationsEvent>(_onGetNotificationsEvent);
    on<GetUnreadNotificationsCountEvent>(_onGetUnreadNotificationsCountEvent);
    on<MarkAllNotificationsAsReadEvent>(_onMarkAllNotificationsAsReadEvent);
    on<DeleteNotificationEvent>(_onDeleteNotificationEvent);
    on<DeleteAllNotificationsEvent>(_onDeleteAllNotificationsEvent);
  }
  Future<void> _onGetNotificationsEvent(
    GetNotificationsEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(NotificationLoading());
    final result = await _repository.getNotifications();
    result.fold(
      (error) => emit(NotificationError(message: error.message)),
      (notifications) => emit(NotificationLoaded(notifications: notifications)),
    );
  }

  Future<void> _onGetUnreadNotificationsCountEvent(
    GetUnreadNotificationsCountEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await _repository.getUnreadNotificationsCount();
    result.fold(
      (error) => emit(NotificationError(message: error.message)),
      (count) => emit(NotificationCountLoaded(count: count)),
    );
  }

  Future<void> _onMarkAllNotificationsAsReadEvent(
  MarkAllNotificationsAsReadEvent event,
  Emitter<NotificationState> emit,
) async {
  final result = await _repository.markAllNotificationsAsRead();
  result.fold(
    (error) => emit(NotificationError(message: error.message)),
    (_) => add(GetNotificationsEvent()), 
  );
}

  Future<void> _onDeleteNotificationEvent(
    DeleteNotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await _repository.deleteNotification(
        notificationId: event.notificationId);
    result.fold(
      (error) => emit(NotificationError(message: error.message)),
      (_) => add(GetNotificationsEvent()),
    );
  }

  Future<void> _onDeleteAllNotificationsEvent(
    DeleteAllNotificationsEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await _repository.deleteAllNotifications();
    result.fold(
      (error) => emit(NotificationError(message: error.message)),
      (_) => add(GetNotificationsEvent()),
    );
  }
}
