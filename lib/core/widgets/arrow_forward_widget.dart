import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/features/onBoarding/presentation/view/choose_access.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondaryColorWithOpacity,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.arrow_forward_rounded,size: 18),
              color: AppColors.surface,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChooseAccess(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
