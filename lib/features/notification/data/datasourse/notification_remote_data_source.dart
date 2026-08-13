import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/features/notification/data/models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
  Future<int> getUnreadNotificationsCount();
  Future<void> markAllNotificationsAsRead();
  Future<void> deleteNotification({required String notificationId});
  Future<void> deleteAllNotifications();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final ApiConsumer _api;

  NotificationRemoteDataSourceImpl(this._api);
  @override
  Future<List<NotificationModel>> getNotifications() async {
    final response = await _api.get(ApiEndpoints.notifications);
    
    return NotificationsResponseModel.fromJson(response).notifications;
  }

  @override
  Future<void> deleteAllNotifications() async {
    final response = await _api.delete(ApiEndpoints.deleteAllNotifications);
    return response;
  }

  @override
  Future<void> deleteNotification({required String notificationId}) async {
    final response = await _api.delete(ApiEndpoints.deleteNotification(notificationId));
    return response;
  }

  @override
  Future<int> getUnreadNotificationsCount() async {
    final response = await _api.get(ApiEndpoints.notifications);
    return NotificationsResponseModel.fromJson(response).unreadCount;
  }

  @override
  Future<void> markAllNotificationsAsRead() async {
    final response = await _api.post(ApiEndpoints.markAllAsRead);
    return response;
  }
}
