class MessageModel {
  final int? id;
  final int? roomId;
  final int? senderId;
  final String? message;
  final bool? isRead;
  final String? createdAt;
  final MessageSenderModel? sender;
  final List<dynamic>? attachments;

  MessageModel({
    this.id,
    this.roomId,
    this.senderId,
    this.message,
    this.isRead,
    this.createdAt,
    this.sender,
    this.attachments,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      roomId: json['room_id'],
      senderId: json['sender_id'],
      message: json['message'],
      isRead: json['is_read'],
      createdAt: json['created_at'],
      sender: json['sender'] != null
          ? MessageSenderModel.fromJson(json['sender'])
          : null,
      attachments: json['attachments'],
    );
  }
}
class MessageSenderModel {
  final int? id;
  final String? name;
  final bool? isMe;
  final String? image;

  MessageSenderModel({
    this.id,
    this.name,
    this.isMe,
    this.image,
  });

  factory MessageSenderModel.fromJson(Map<String, dynamic> json) {
    return MessageSenderModel(
      id: json['id'],
      name: json['name'],
      isMe: json['is_me'],
      image: json['image'],
    );
  }
}