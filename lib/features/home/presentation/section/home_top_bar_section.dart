import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_images.dart';

class HomeTopBarSection extends StatelessWidget {
  const HomeTopBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Image(image: const AssetImage(AppImages.logo), height: 40),
        const Spacer(),
        GestureDetector(
          onTap: () => context.push(RouteNames.showNotification),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryHintColorWithOpacity,
              shape: BoxShape.circle,
            ),
            width: 40,
            height: 40,
            child: Icon(Icons.notifications_on_outlined,
                color: AppColors.surface, size: 20),
          ),
        ),
      ],
    );
  }
}
