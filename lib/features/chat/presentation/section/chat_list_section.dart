import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/utils/date_formatter.dart';
import 'package:mostkdm/features/chat/data/models/chat_model.dart';
import 'package:mostkdm/features/chat/presentation/bloc/chats_bloc.dart';
import 'package:mostkdm/features/chat/presentation/bloc/chats_event.dart';
import 'package:mostkdm/features/chat/presentation/bloc/chats_state.dart';
import 'package:mostkdm/features/chat/presentation/section/chats_empty_section.dart';
import 'package:mostkdm/features/chat/presentation/widgets/chat_card.dart';

class ChatsListSection extends StatelessWidget {
  const ChatsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatBloc>()..add(GetChatsEvent()),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is GetChatsLoadingState) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is GetChatsErrorState) {
            return Center(child: Text(state.message));
          }
          if (state is GetChatsSuccessState) {
            final List<ChatModel> chats = state.chats;
            if (chats.isEmpty) {
              return const ChatsEmptySection();
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: chats.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final item = chats[i];

                return ChatCard(
                  name: item.otherUser?.name ?? '',
                  lastMessage: item.chat?.lastMessage?.message ?? '',
                  time: DateFormatter.formatTimeAgo(
                      item.chat?.lastMessage?.createdAt),
                  isRead: item.chat?.lastMessage?.isRead ?? false,
                  adTitle: item.ad?.title ?? '',
                  adImage: item.ad?.image ?? '',
                  userImage: item.otherUser?.image ?? '',
                  onTap: () => context.push(
                    RouteNames.chatDetails,
                    extra: item,
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
