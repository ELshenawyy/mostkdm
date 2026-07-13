import 'package:flutter/material.dart';
import 'package:mostkdm/features/chat/data/dummy_chat.dart';
import 'package:mostkdm/features/chat/data/models/message_model.dart';
import 'package:mostkdm/features/chat/presentation/widgets/message_bubble.dart';

class ChatMessagesSection extends StatelessWidget {
  const ChatMessagesSection({super.key});
  final List<MessageModel> _messages = dummyMessages;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: _messages.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) => MessageBubble(
        message: _messages[i].message,
        time: _messages[i].time,
        isSender: _messages[i].isSender,
      ),
    );
  }
}
