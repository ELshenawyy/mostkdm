import 'package:mostkdm/features/notification/data/models/notification_model.dart';

class NotificationDummyData {
  static final NotificationModel _dummyNotification = NotificationModel(
    id: "0",
    title: 'عنوان إشعار تجريبي لاختبار التحميل',
    message: 'هذا نص فرعي تجريبي يمثل تفاصيل الإشعار أثناء ظهور تأثير التهميش.',
    createdAt: 'منذ دقيقة',
    isRead: false,
  );

  static List<NotificationModel> get dummyNotificationsList =>
      List<NotificationModel>.generate(6, (_) => _dummyNotification);
}