import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

class MainNavBarSection extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const MainNavBarSection({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      padding: EdgeInsets.zero,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
              icon: Icons.home_outlined,
              label: 'الرئيسية',
              index: 0,
              current: currentIndex,
              onTap: onTap),
          _NavItem(
              icon: Icons.campaign_outlined,
              label: 'الإعلانات',
              index: 1,
              current: currentIndex,
              onTap: onTap),
          const SizedBox(width: 40),
          _NavItem(
              icon: Icons.chat_bubble_outline,
              label: 'الدردشة',
              index: 3,
              current: currentIndex,
              onTap: onTap),
          _NavItem(
              icon: Icons.grid_view_outlined,
              label: 'المزيد',
              index: 4,
              current: currentIndex,
              onTap: onTap),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int current;
  final void Function(int) onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == current;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 16),
          Icon(icon,
              color: isSelected ? AppColors.secondaryColor : Colors.grey),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isSelected ? AppColors.secondaryColor : Colors.grey,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 3,
            width: isSelected ? 24 : 0,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
