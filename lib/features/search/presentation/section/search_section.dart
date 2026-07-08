import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/widgets/app_search_field.dart';
import 'package:mostkdm/features/search/presentation/widget/filter_bottom_sheet.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: AppSearchField(
        style: AppSearchFieldStyle.light,
        onFieldTap: () => context.push(RouteNames.search),
        onFilterTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => DraggableScrollableSheet(
              initialChildSize: 0.8,
              minChildSize: 0.8,
              maxChildSize: 1,
              builder: (_, controller) => const FilterBottomSheet(),
            ),
          );
        },
      ),
    );
  }
}
