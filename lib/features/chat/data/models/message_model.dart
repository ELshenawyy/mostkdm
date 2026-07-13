// features/chat/data/models/message_model.dart

class MessageModel {
  final String id;
  final String message;
  final String time;
  final bool isSender;
  final String? price;

  const MessageModel({
    required this.id,
    required this.message,
    required this.time,
    this.isSender = false,
    this.price,
  });
}