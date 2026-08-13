import 'package:mostkdm/features/chat/data/models/chat_model.dart';

class ChatDummyData {
  static ChatModel get dummyChat => ChatModel(
        id: 0,
        ad: ChatAdModel(
          id: 0,
          title: 'عنوان الإعلان المتعلق بالمحادثة',
          image: '',
        ),
        otherUser: ChatUserModel(
          id: 0,
          name: 'اسم المستخدم',
          image: '',
        ),
        chat: ChatInfoModel(
          id: 0,
          status: 'active',
          unreadMessagesCount: 2,
          lastMessage: LastMessageModel(
            id: 0,
            message: 'هذا نص آخر رسالة تجريبية لاختبار الـ Skeletonizer',
            isRead: false,
            createdAt: DateTime.now().toIso8601String(),
          ),
        ),
      );

  static List<ChatModel> get dummyChatsList =>
      List<ChatModel>.generate(5, (_) => dummyChat);
}