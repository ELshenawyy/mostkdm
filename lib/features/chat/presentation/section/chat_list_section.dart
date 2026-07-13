import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/features/chat/data/dummy_chat.dart';
import 'package:mostkdm/features/chat/data/models/chat_model.dart';
import 'package:mostkdm/features/chat/presentation/section/chats_empty_section.dart';
import 'package:mostkdm/features/chat/presentation/widgets/chat_card.dart';

class ChatsListSection extends StatelessWidget {
  const ChatsListSection({super.key});
  final List<ChatModel> _chats = dummyChats;

  @override
  Widget build(BuildContext context) {
    if (_chats.isEmpty) return const ChatsEmptySection();

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _chats.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) => ChatCard(
        name: _chats[i].name,
        lastMessage: _chats[i].lastMessage,
        time: _chats[i].time,
        isRead: _chats[i].isRead,
        adTitle: _chats[i].adTitle,
        userImage: _chats[i].userImage,
        onTap: () => context.push(
          RouteNames.chatDetails,
          extra: _chats[i],
        ),
      ),
    );
  }
}
