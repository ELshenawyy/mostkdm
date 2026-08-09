import 'package:dartz/dartz.dart';
import 'package:mostkdm/core/errors/app_exception.dart';
import 'package:mostkdm/features/chat/data/datasource/get_chats_remote_data_souece.dart';
import 'package:mostkdm/features/chat/data/models/chat_model.dart';
import 'package:mostkdm/features/chat/data/models/message_model.dart';

abstract class ChatsRepository {
  Future<Either<AppException, List<ChatModel>>> getChats();
  Future<Either<AppException, List<MessageModel>>> getMessages(int roomId);
  Future<Either<AppException, MessageModel>> sendMessage(
      {required int roomId, required String message});
}

class GetChatsRepositoryImpl implements ChatsRepository {
  final ChatsRemoteDataSource remoteDataSource;

  GetChatsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<AppException, List<ChatModel>>> getChats() async {
    try {
      final result = await remoteDataSource.getChats();
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, List<MessageModel>>> getMessages(
      int roomId) async {
    try {
      final result = await remoteDataSource.getMessages(roomId);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, MessageModel>> sendMessage(
      {required int roomId, required String message}) async {
    try {
      final result =
          await remoteDataSource.sendMessage(roomId: roomId, message: message);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}
