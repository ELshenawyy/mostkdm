import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/widgets/AppConfirmBottomSheet.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
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

  List<Map<String, dynamic>> get _filteredNotifications => _selectedTab == 0
      ? _notifications
      : _notifications.where((n) => n['isRead'] == false).toList();

  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'تم قبول إعلانك',
      'subtitle': 'تم قبول إعلانك وأصبح متاحاً للجميع',
      'time': 'منذ 2 يوم',
      'isRead': false,
    },
    {
      'title': 'رسالة جديدة',
      'subtitle': 'لديك رسالة جديدة من أحمد محمد',
      'time': 'منذ 3 يوم',
      'isRead': true,
    },
    {
      'title': 'تم قبول إعلانك',
      'subtitle': 'تم قبول إعلانك وأصبح متاحاً للجميع',
      'time': 'منذ 5 يوم',
      'isRead': true,
    },
  ];

  

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
            onConfirm: () => setState(() => _notifications.clear()),
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
              child: const Icon(Icons.notifications_off_outlined,
                  color: Colors.red, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_notifications.isEmpty) return const NotificationsEmptySection();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Column(
        children: [
          LocalAppBar(
            title: "الاشعارات",
            icon: Icons.delete_outlined,
            onIconTap: _showDeleteAllSheet,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: (16.0)),
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
                          color: _selectedTab == 1
                              ? Colors.grey
                              : AppColors.secondaryColor,
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
                      Text('الغير مقروء',
                          style: TextStyle(
                            color: _selectedTab == 1
                                ? AppColors.secondaryColor
                                : Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                          )),
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
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _notifications.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) => NotificationCard(
              title: _notifications[i]['title'],
              subtitle: _notifications[i]['subtitle'],
              time: _notifications[i]['time'],
              isRead: _notifications[i]['isRead'],
            ),
          ),
        ],
      ),
    );
  }
}
