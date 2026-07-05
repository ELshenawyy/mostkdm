import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/arrow_forward_widget.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.title, required this.subtitle, required this.imagePath});
  final String title;
  final String subtitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ArrowBackWidget(),
          Image(
            image: AssetImage(imagePath),
            width: 52,
            height: 52,
          ),
          SizedBox(height: 16),
          Text(
            title,
            style: AppTextStyle.headline1
                .copyWith(decoration: TextDecoration.none),
          ),
          Text(
            subtitle,
            style: AppTextStyle.headline2
                .copyWith(decoration: TextDecoration.none),
          ),
        ],
      
    );
  }
}
