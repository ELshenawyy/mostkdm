import 'package:flutter/material.dart';
import 'package:mostkdm/features/notification/presentation/section/notifications_list_section.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: NotificationsListSection(),
      ),
    );
  }
}