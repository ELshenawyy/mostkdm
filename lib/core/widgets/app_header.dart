import 'package:flutter/widgets.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

class AppHeader extends StatelessWidget {
  final Widget child;
  final double? height;


  const AppHeader({super.key, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
