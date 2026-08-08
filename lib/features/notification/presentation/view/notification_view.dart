import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/di/service_locator.dart'; 
import 'package:mostkdm/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:mostkdm/features/notification/presentation/section/notifications_list_section.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotificationBloc>(),
      child: const Scaffold(
        body: SafeArea(
          child: NotificationsListSection(),
        ),
      ),
    );
  }
}