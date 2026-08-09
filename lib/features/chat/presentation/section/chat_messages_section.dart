import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/utils/date_formatter.dart';
import 'package:mostkdm/features/chat/presentation/bloc/chats_bloc.dart';
import 'package:mostkdm/features/chat/presentation/bloc/chats_state.dart';
import 'package:mostkdm/features/chat/presentation/widgets/message_bubble.dart';

class ChatMessagesSection extends StatelessWidget {
  const ChatMessagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listenWhen: (previous, current) =>
          current is SendMessageErrorState,
      listener: (context, state) {
        if (state is SendMessageErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      buildWhen: (previous, current) =>
          current is GetMessagesLoadingState ||
          current is GetMessagesSuccessState ||
          current is GetMessagesErrorState,
      builder: (context, state) {
        if (state is GetMessagesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetMessagesErrorState) {
          return Center(child: Text(state.message));
        }

        if (state is GetMessagesSuccessState) {
          final messages = state.messages;

          if (messages.isEmpty) {
            return const Center(child: Text('لا توجد رسائل بعد'));
          }

          return ListView.separated(
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: messages.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              final message = messages[i];

              return MessageBubble(
                message: message.message ?? '',
                time: DateFormatter.formatTimeAgo(message.createdAt),
                isSender: message.sender?.isMe ?? false,
                userImage: message.sender?.image,
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}