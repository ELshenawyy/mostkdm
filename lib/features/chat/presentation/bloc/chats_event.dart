import 'package:equatable/equatable.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class GetChatsEvent extends ChatEvent {}

class GetMessagesEvent extends ChatEvent {
  final int roomId;

  const GetMessagesEvent({required this.roomId});

  @override
  List<Object> get props => [roomId];
}

class SendMessageEvent extends ChatEvent {
  final int roomId;
  final String message;

  const SendMessageEvent({required this.roomId, required this.message});

  @override
  List<Object> get props => [roomId, message];
}


