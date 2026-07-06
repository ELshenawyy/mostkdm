import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/app_search_field.dart';

class HomeSearchSection extends StatelessWidget {
  const HomeSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: AppSearchField(
        onFilterTap: () {},
      ),
    );
  }
}
