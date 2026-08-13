import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/widgets/app_search_field.dart';

class HomeSearchSection extends StatelessWidget {
  const HomeSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: AppSearchField(
        style: AppSearchFieldStyle.dark,
        onFieldTap: () => context.push(RouteNames.search),
        onFilterTap: () => context.push(RouteNames.search, extra: true),
      ),
    );
  }
}