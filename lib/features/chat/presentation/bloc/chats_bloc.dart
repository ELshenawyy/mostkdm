import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/chat/data/models/message_model.dart';
import 'package:mostkdm/features/chat/data/repository/chats_repository.dart';
import 'package:mostkdm/features/chat/presentation/bloc/chats_event.dart';
import 'package:mostkdm/features/chat/presentation/bloc/chats_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatsRepository chatRepository;
  List<MessageModel> _messagesList = [];

  ChatBloc({required this.chatRepository}) : super(ChatInitial()) {
    on<GetChatsEvent>(_getChatsEvent);
    on<SendMessageEvent>(_sendMessageEvent);
    on<GetMessagesEvent>(_getMessagesEvent);
  }

  Future<void> _getChatsEvent(
      GetChatsEvent event, Emitter<ChatState> emit) async {
    emit(GetChatsLoadingState());

    final result = await chatRepository.getChats();

    result.fold(
      (failure) => emit(GetChatsErrorState(message: failure.message)),
      (chats) => emit(GetChatsSuccessState(chats: chats)),
    );
  }

  Future<void> _sendMessageEvent(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    final result = await chatRepository.sendMessage(
      message: event.message,
      roomId: event.roomId,
    );

    result.fold(
      (failure) => emit(SendMessageErrorState(failure.message)),
      (newMessage) {
        _messagesList.insert(0, newMessage);
        emit(GetMessagesSuccessState(List<MessageModel>.from(_messagesList)));
      },
    );
  }

  Future<void> _getMessagesEvent(
      GetMessagesEvent event, Emitter<ChatState> emit) async {

  emit(GetMessagesLoadingState());

    final result = await chatRepository.getMessages(event.roomId);

    result.fold(
      (failure) => emit(GetMessagesErrorState(failure.message)),
      (messages) {
        _messagesList = List.from(messages);
        emit(GetMessagesSuccessState(List<MessageModel>.from(_messagesList)));
      },
    );
  }
}