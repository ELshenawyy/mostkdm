import 'package:flutter/material.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/features/settings/presentation/widgets/more_item.dart';

class MoreListSection extends StatelessWidget {
  const MoreListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('إعدادات الحساب',
            style: AppTextStyle.headline1
                .copyWith(fontSize: 16, color: AppColors.surface)),
        const SizedBox(height: 8),
        MoreItem(
          title: 'الملف الشخصي',
          icon: Icons.person_outline,
          onTap: () => context.push(RouteNames.profile),
          subtitle: 'عرض وتعديل معلوماتك',
        ),
        const SizedBox(height: 8),
        MoreItem(
          title: 'المحفظة',
          icon: Icons.wallet_outlined,
          onTap: () => context.push(RouteNames.wallet),
          subtitle: 'عرض المحفظة',
        ),
        const SizedBox(height: 8),
        MoreItem(
          title: 'الباقات والإشتراكات',
          icon: Icons.card_membership_outlined,
          onTap: () => context.push(RouteNames.subscriptions),
          subtitle: 'إشترك فى باقة مميزة',
        ),
        const SizedBox(height: 8),
        MoreItem(
          title: 'المفضلة والمتابعة',
          icon: Icons.favorite_outline,
          onTap: () {},
          subtitle: 'عرض المفضلة والمتابعة',
        ),
        const SizedBox(height: 16),
        _buildSectionTitle('إعدادات عامة',
            style: AppTextStyle.headline1.copyWith(fontSize: 16)),
        const SizedBox(height: 8),
        MoreItem(
          title: 'الإشعارات',
          icon: Icons.notifications_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        MoreItem(
          title: 'دفع المعلومة',
          icon: Icons.payment_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        MoreItem(
          title: 'الشروط & السياسة',
          icon: Icons.description_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        MoreItem(
          title: 'تسجيل الخروج',
          icon: Icons.logout_outlined,
          isLogout: true,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, {required TextStyle style}) {
    return Text(
      title,
      style: style,
    );
  }
}
