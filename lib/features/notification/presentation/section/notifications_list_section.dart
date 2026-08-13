import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/widgets/AppConfirmBottomSheet.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/notification/data/models/notification_dummy_data.dart';
import 'package:mostkdm/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:mostkdm/features/notification/presentation/section/notification_empty_section.dart';
import 'package:mostkdm/features/notification/presentation/widgets/notification_card.dart';

class NotificationsListSection extends StatefulWidget {
  const NotificationsListSection({super.key});

  @override
  State<NotificationsListSection> createState() =>
      _NotificationsListSectionState();
}

class _NotificationsListSectionState extends State<NotificationsListSection> {
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().add(GetNotificationsEvent());
  }

  void _showDeleteAllSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          AppConfirmBottomSheet(
            title: 'حذف الإشعارات',
            subtitle: 'هل أنت متأكد من أنك تريد حذف جميع الإشعارات',
            confirmLabel: 'حذف',
            onConfirm: () {
              Navigator.pop(context);
              context
                  .read<NotificationBloc>()
                  .add(DeleteAllNotificationsEvent());
            },
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
              ),
              child: const Icon(
                Icons.notifications_off_outlined,
                color: Colors.red,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
      listener: (context, state) {
        if (state is NotificationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is NotificationLoading;

        final allNotifications = isLoading
            ? NotificationDummyData.dummyNotificationsList
            : (state is NotificationLoaded ? state.notifications : []);

        if (!isLoading && allNotifications.isEmpty) {
          return const NotificationsEmptySection();
        }

        final filteredNotifications = _selectedTab == 0
            ? allNotifications
            : allNotifications.where((n) => !n.isRead).toList();

        return Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: LocalAppBar(
                  title: "الاشعارات",
                  icon: Icons.delete_outlined,
                  onIconTap: isLoading ? null : _showDeleteAllSheet,
                  prefixIcon: Icons.arrow_back_outlined,
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => _selectedTab = 0),
                      child: Column(
                        children: [
                          Text(
                            'الكل',
                            style: TextStyle(
                              color: _selectedTab == 0
                                  ? AppColors.secondaryColor
                                  : Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          if (_selectedTab == 0)
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              height: 2,
                              width: 30,
                              color: AppColors.primaryColor,
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () => setState(() => _selectedTab = 1),
                      child: Column(
                        children: [
                          Text(
                            'الغير مقروء',
                            style: TextStyle(
                              color: _selectedTab == 1
                                  ? AppColors.secondaryColor
                                  : Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          if (_selectedTab == 1)
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              height: 2,
                              width: 60,
                              color: AppColors.primaryColor,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Skeletonizer(
                  enabled: isLoading,
                  child: (!isLoading && filteredNotifications.isEmpty)
                      ? const Center(
                          child: Text(
                            'لا توجد إشعارات غير مقروءة',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          itemCount: filteredNotifications.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, i) {
                            final item = filteredNotifications[i];
                            return NotificationCard(
                              title: item.title,
                              subtitle: item.message,
                              time: item.createdAt,
                              isRead: item.isRead,
                              onDelete: isLoading
                                  ? null
                                  : () {
                                      context.read<NotificationBloc>().add(
                                            DeleteNotificationEvent(
                                                notificationId: item.id),
                                          );
                                    },
                              onTap: isLoading
                                  ? null
                                  : () {
                                      if (!item.isRead) {
                                        context.read<NotificationBloc>().add(
                                              MarkAllNotificationsAsReadEvent(),
                                            );
                                      }
                                    },
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}