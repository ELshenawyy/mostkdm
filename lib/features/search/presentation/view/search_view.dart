import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/search/presentation/section/search_empty_section.dart';
import 'package:mostkdm/features/search/presentation/section/search_result_section.dart';
import 'package:mostkdm/features/search/presentation/section/search_section.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool _hasResults = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 20),
        LocalAppBar(title: "البحث"),
        SearchSection(),
        Expanded(
          child: _hasResults
              ?  SingleChildScrollView(
                  child: SearchResultsSection(),
                )
              : const SearchEmptySection(),
        ),
      ],
    ));
  }
}
