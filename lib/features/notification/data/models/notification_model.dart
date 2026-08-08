class NotificationModel {
  final String id;
  final String title;
  final String message;
  final bool isRead;
  final String createdAt;

  NotificationModel(
      {required this.id,
      required this.title,
      required this.message,
      required this.isRead,
      required this.createdAt});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['data']['title'],
      message: json['data']['message'],
      isRead: json['is_read'],
      createdAt: json['created_at'],
    );
  }
}

class NotificationsResponseModel {
  final List<NotificationModel> notifications;
  final int unreadCount;

  NotificationsResponseModel({
    required this.notifications,
    required this.unreadCount,
  });

  factory NotificationsResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return NotificationsResponseModel(
      unreadCount: data['notifications_unread_count'] ?? 0,
      notifications: (data['notifications'] as List? ?? [])
          .map((e) => NotificationModel.fromJson(e))
          .toList(),
    );
  }
}
