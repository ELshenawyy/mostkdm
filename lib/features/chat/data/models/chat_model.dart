class ChatModel {
  final int? id;
  final ChatAdModel? ad;
  final ChatUserModel? otherUser;
  final ChatInfoModel? chat;

  ChatModel({
    this.id,
    this.ad,
    this.otherUser,
    this.chat,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      ad: json['ad'] != null ? ChatAdModel.fromJson(json['ad']) : null,
      otherUser: json['other_user'] != null
          ? ChatUserModel.fromJson(json['other_user'])
          : null,
      chat: json['chat'] != null ? ChatInfoModel.fromJson(json['chat']) : null,
    );
  }
}

class ChatAdModel {
  final int? id;
  final String? title;
  final String? image;

  ChatAdModel({this.id, this.title, this.image});

  factory ChatAdModel.fromJson(Map<String, dynamic> json) {
    return ChatAdModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}

class ChatUserModel {
  final int? id;
  final String? name;
  final String? image;

  ChatUserModel({this.id, this.name, this.image});

  factory ChatUserModel.fromJson(Map<String, dynamic> json) {
    return ChatUserModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class LastMessageModel {
  final int? id;
  final String? message;
  final bool? isRead;
  final String? createdAt;

  LastMessageModel({
    this.id,
    this.message,
    this.isRead,
    this.createdAt,
  });

  factory LastMessageModel.fromJson(Map<String, dynamic> json) {
    return LastMessageModel(
      id: json['id'],
      message: json['message'],
      isRead: json['is_read'],
      createdAt: json['created_at'],
    );
  }
}

class ChatInfoModel {
  final int? id;
  final String? status;
  final LastMessageModel? lastMessage;
  final int? unreadMessagesCount;

  ChatInfoModel(
      {this.id, this.status, this.lastMessage, this.unreadMessagesCount});

  factory ChatInfoModel.fromJson(Map<String, dynamic> json) {
    return ChatInfoModel(
      id: json['id'],
      status: json['status'],
      lastMessage: json['last_message'] != null
          ? LastMessageModel.fromJson(json['last_message'])
          : null,
      unreadMessagesCount: json['unread_messages_count'],
    );
  }
}
