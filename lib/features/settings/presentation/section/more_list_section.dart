import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mostkdm/features/policies/data/policy_data.dart';
import 'package:mostkdm/features/settings/presentation/widgets/more_item.dart';

class MoreListSection extends StatefulWidget {
  const MoreListSection({super.key});

  @override
  State<MoreListSection> createState() => _MoreListSectionState();
}

class _MoreListSectionState extends State<MoreListSection> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(
        builder: (context) => BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.go(RouteNames.chooseAccess);
            }
          },
          child: Column(
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
                onTap: () => context.push(RouteNames.favorites),
                subtitle: 'عرض المفضلة والمتابعة',
              ),
              const SizedBox(height: 16),
              _buildSectionTitle('إعدادات عامة',
                  style: AppTextStyle.headline1.copyWith(fontSize: 16)),
              const SizedBox(height: 8),
              MoreItem(
                title: 'الإشعارات',
                icon: Icons.notifications_outlined,
                onTap: () => context.push(RouteNames.notifications),
              ),
              const SizedBox(height: 8),
              MoreItem(
                title: 'دفع المعلومة',
                icon: Icons.payment_outlined,
                onTap: () => context.push(RouteNames.commission),
              ),
              const SizedBox(height: 8),
              MoreItem(
                title: 'سياسة الخصوصية',
                icon: Icons.privacy_tip_outlined,
                onTap: () => context.push(RouteNames.policy, extra: {
                  'title': PolicyData.privacyPolicyTitle,
                  'content': PolicyData.privacyPolicyContent,
                  'icon': PolicyData.privacyPolicyIcon
                }),
              ),
              const SizedBox(height: 8),
              MoreItem(
                title: 'شروط الاستخدام',
                icon: Icons.article_outlined,
                onTap: () => context.push(RouteNames.policy, extra: {
                  'title': PolicyData.termsOfUseTitle,
                  'content': PolicyData.termsOfUseContent,
                  'icon': PolicyData.termsOfUseIcon
                }),
              ),
              const SizedBox(height: 8),
              MoreItem(
                title: 'تسجيل الخروج',
                icon: Icons.logout_outlined,
                isLogout: true,
                onTap: () => context.read<AuthBloc>().add(LogoutEvent()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, {required TextStyle style}) {
    return Text(
      title,
      style: style,
    );
  }
}
