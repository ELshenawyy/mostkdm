import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/widgets/app_search_field.dart';
import 'package:mostkdm/features/search/presentation/bloc/search_bloc.dart';
import 'package:mostkdm/features/search/presentation/widget/filter_bottom_sheet.dart';

class SearchSection extends StatelessWidget {
  final bool isInteractive;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autofocus;
  final VoidCallback? onFilterTap; 

  const SearchSection({
    super.key,
    this.isInteractive = false,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
    this.onFilterTap, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: AppSearchField(
        style: AppSearchFieldStyle.light,
        controller: isInteractive ? controller : null,
        onChanged: isInteractive ? onChanged : null,
        onSubmitted: isInteractive ? onSubmitted : null,
        autofocus: isInteractive && autofocus,
        onFieldTap:
            isInteractive ? null : () => context.push(RouteNames.search),
        onFilterTap: onFilterTap ??
            () {
              if (isInteractive) {
                FilterBottomSheet.show(context, context.read<SearchBloc>());
              } else {
                context.push(RouteNames.search, extra: true);
              }
            },
      ),
    );
  }
}