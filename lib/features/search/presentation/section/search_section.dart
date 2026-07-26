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

  const SearchSection({
    super.key,
    this.isInteractive = false,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
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
        onFilterTap: () {
          // Grab the SearchBloc from THIS context (a descendant of the
          // provider) before opening the modal -- showModalBottomSheet
          // inserts its content into the Navigator's Overlay, which is
          // NOT a descendant of this widget tree, so context.read
          // inside FilterBottomSheet itself would throw
          // ProviderNotFoundException without this.
          final searchBloc = context.read<SearchBloc>();

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => BlocProvider.value(
              value: searchBloc,
              child: DraggableScrollableSheet(
                initialChildSize: 0.8,
                minChildSize: 0.8,
                maxChildSize: 1,
                builder: (_, controller) => const FilterBottomSheet(),
              ),
            ),
          );
        },
      ),
    );
  }
}