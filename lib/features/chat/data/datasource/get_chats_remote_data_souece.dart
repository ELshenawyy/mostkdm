import 'package:mostkdm/core/network/api_consumer.dart';
import 'package:mostkdm/core/network/api_endpoints.dart';
import 'package:mostkdm/features/chat/data/models/chat_model.dart';
import 'package:mostkdm/features/chat/data/models/message_model.dart';

abstract class ChatsRemoteDataSource {
  Future<List<ChatModel>> getChats();
  Future<List<MessageModel>> getMessages(int roomId);
  Future<MessageModel> sendMessage(
      {required int roomId, required String message});
}

class ChatsRemoteDataSourceImpl implements ChatsRemoteDataSource {
  final ApiConsumer _api;

  ChatsRemoteDataSourceImpl({required ApiConsumer api}) : _api = api;

  @override
  Future<List<ChatModel>> getChats() async {
    final response = await _api.get(ApiEndpoints.getChats);
    return (response['data'] as List)
        .map((e) => ChatModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<MessageModel>> getMessages(int roomId) async {
    final response = await _api.get(ApiEndpoints.getMessages(roomId));
    return (response['data'] as List)
        .map((e) => MessageModel.fromJson(e))
        .toList();
  }

  @override
  Future<MessageModel> sendMessage(
      {required int roomId, required String message}) async {
    final response = await _api.post(ApiEndpoints.sendMessage, data: {
      'room_id': roomId,
      'message': message,
    });
    return MessageModel.fromJson(response['data']);
  }
}
