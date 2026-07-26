import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/search/presentation/bloc/search_bloc.dart';
import 'package:mostkdm/features/search/presentation/section/search_empty_section.dart';
import 'package:mostkdm/features/search/presentation/section/search_result_section.dart';
import 'package:mostkdm/features/search/presentation/section/search_section.dart';
import 'package:mostkdm/features/search/presentation/section/search_suggestions_section.dart';

/// Owns the SearchBloc + the search field's controller, so SearchView
/// itself can stay a plain, stateless composition of AppBar + this
/// section.
class SearchContentSection extends StatelessWidget {
  const SearchContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBloc()
        ..add(const GetSearchHistoryEvent())
        ..add(const GetTopKeywordsEvent()),
      child: const _SearchContentBody(),
    );
  }
}

class _SearchContentBody extends StatefulWidget {
  const _SearchContentBody();

  @override
  State<_SearchContentBody> createState() => _SearchContentBodyState();
}

class _SearchContentBodyState extends State<_SearchContentBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    if (value.isEmpty) {
      context.read<SearchBloc>()
        ..add(const GetSearchHistoryEvent())
        ..add(const GetTopKeywordsEvent());
    }
  }

  void _onSubmitted(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return;
    context.read<SearchBloc>().add(SearchKeywordEvent(keyword: trimmed));
  }

  void _onSelectSuggestion(String keyword) {
    _controller.text = keyword;
    _onSubmitted(keyword);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchSection(
          isInteractive: true,
          controller: _controller,
          autofocus: true,
          onChanged: _onChanged,
          onSubmitted: _onSubmitted,
        ),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            // FilterOptionsLoaded/SubCategoriesLoaded only matter to the
            // filter bottom sheet -- ignore them here so opening the
            // filter doesn't flicker/reset whatever this body is
            // currently showing (results or suggestions).
            buildWhen: (previous, current) =>
                current is! FilterOptionsLoaded &&
                current is! SubCategoriesLoaded,
            builder: (context, state) {
              return switch (state) {
                SearchInitial() ||
                SearchLoading() =>
                  const Center(child: CircularProgressIndicator()),
                SearchError(:final message) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(message, textAlign: TextAlign.center),
                    ),
                  ),
                SearchSuggestionsLoaded(:final history, :final trending) =>
                  SearchSuggestionsSection(
                    history: history,
                    trending: trending,
                    onSelectKeyword: _onSelectSuggestion,
                    onDeleteHistory: (id) => context
                        .read<SearchBloc>()
                        .add(DeleteSearchHistoryItemEvent(id)),
                  ),
                SearchSuccess(:final ads) => ads.isEmpty
                    ? const SearchEmptySection()
                    : SingleChildScrollView(
                        child: SearchResultsSection(ads: ads),
                      ),
                // Unreachable in practice because of buildWhen above --
                // still required so the switch is exhaustive over every
                // SearchState subtype.
                FilterOptionsLoaded() || SubCategoriesLoaded() =>
                  const SizedBox.shrink(),
              };
            },
          ),
        ),
      ],
    );
  }
}