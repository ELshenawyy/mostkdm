import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/chat/data/models/chat_model.dart';
import 'package:mostkdm/features/chat/presentation/section/chat_input_section.dart';
import 'package:mostkdm/features/chat/presentation/section/chat_messages_section.dart';


class ChatDetailsView extends StatelessWidget {
  final ChatModel chat;

  const ChatDetailsView({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: LocalAppBar(title: chat.name),
            ),
            const Expanded(
              child: ChatMessagesSection(),
            ),
            const ChatInputSection(),
          ],
        ),
      ),
    );
  }
}