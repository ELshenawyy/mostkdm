import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/chat/presentation/section/chat_list_section.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: LocalAppBar(title: 'الرسائل'),
            ),
            const ChatsListSection(),
          ],
        ),
      ),
    );
  }
}