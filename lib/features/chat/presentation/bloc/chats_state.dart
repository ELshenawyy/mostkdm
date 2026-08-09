import 'package:equatable/equatable.dart';
import 'package:mostkdm/features/chat/data/models/chat_model.dart';
import 'package:mostkdm/features/chat/data/models/message_model.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class GetChatsLoadingState extends ChatState {}

final class GetChatsSuccessState extends ChatState {
  final List<ChatModel> chats;

  const GetChatsSuccessState({required this.chats});

  @override
  List<Object> get props => [chats];
}

final class GetChatsErrorState extends ChatState {
  final String message;

  const GetChatsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class GetMessagesLoadingState extends ChatState {}

class GetMessagesSuccessState extends ChatState {
  final List<MessageModel> messages;
  const GetMessagesSuccessState(this.messages);

  @override
  List<Object> get props => [messages];
}

class GetMessagesErrorState extends ChatState {
  final String message;
  const GetMessagesErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class SendMessageLoadingState extends ChatState {}

class SendMessageSuccessState extends ChatState {
  final MessageModel message;
  const SendMessageSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class SendMessageErrorState extends ChatState {
  final String message;
  const SendMessageErrorState(this.message);

  @override
  List<Object> get props => [message];
}
