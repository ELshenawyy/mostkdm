import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/search/presentation/bloc/search_bloc.dart';
import 'package:mostkdm/features/search/presentation/section/search_content_section.dart';
import 'package:mostkdm/features/search/presentation/widget/filter_bottom_sheet.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = getIt<SearchBloc>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extraData = GoRouterState.of(context).extra;
      if (extraData is bool && extraData == true && mounted) {
        FilterBottomSheet.show(context, _searchBloc);
      }
    });
  }

  @override
  void dispose() {
    _searchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _searchBloc,
      child: const Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: LocalAppBar(
                title: "البحث",
                prefixIcon: Icons.arrow_back_outlined,
              ),
            ),
            Expanded(child: SearchContentSection()),
          ],
        ),
      ),
    );
  }
}