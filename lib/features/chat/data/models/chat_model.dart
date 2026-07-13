class ChatModel {
  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final bool isRead;
  final String? adTitle;
  final String? userImage;
  final String? adImage;
  final bool isClosed;
  final int unreadCount;

  const ChatModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.isRead = true,
    this.adTitle,
    this.userImage,
    this.adImage,
    this.isClosed = false,
    this.unreadCount = 0,
  });
}
