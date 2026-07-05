import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_images.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/arrow_forward_widget.dart';

class SignupHeaderSection extends StatelessWidget {
  const SignupHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ArrowBackWidget(),
          Image(
            image: AssetImage(AppImages.joinUsIcon),
            width: 52,
            height: 52,
          ),
          SizedBox(height: 16),
          Text(
            'إنضم إلينا',
            style: AppTextStyle.headline1
                .copyWith(decoration: TextDecoration.none),
          ),
          Text(
            'أنشئ حساباً جديداً وابدأ رحلتك',
            style: AppTextStyle.headline2
                .copyWith(decoration: TextDecoration.none),
          ),
        ],
      
    );
  }
}
