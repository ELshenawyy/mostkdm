import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mostkdm/core/utils/core_dummy_data.dart';
import 'package:mostkdm/features/search/presentation/bloc/search_bloc.dart';
import 'package:mostkdm/features/search/presentation/section/search_empty_section.dart';
import 'package:mostkdm/features/search/presentation/section/search_result_section.dart';
import 'package:mostkdm/features/search/presentation/section/search_section.dart';
import 'package:mostkdm/features/search/presentation/section/search_suggestions_section.dart';
import 'package:mostkdm/features/search/presentation/widget/filter_bottom_sheet.dart';

class SearchContentSection extends StatefulWidget {
  const SearchContentSection({super.key});

  @override
  State<SearchContentSection> createState() => _SearchContentSectionState();
}

class _SearchContentSectionState extends State<SearchContentSection> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final bloc = context.read<SearchBloc>();
    if (bloc.state is SearchInitial) {
      bloc
        ..add(const GetSearchHistoryEvent())
        ..add(const GetTopKeywordsEvent());
    }
  }

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
        Skeleton.ignore(
          child: SearchSection(
            isInteractive: true,
            controller: _controller,
            autofocus: true,
            onChanged: _onChanged,
            onSubmitted: _onSubmitted,
            onFilterTap: () => FilterBottomSheet.show(context, context.read<SearchBloc>()),
          ),
        ),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            buildWhen: (previous, current) =>
                current is! FilterOptionsLoaded && current is! SubCategoriesLoaded,
            builder: (context, state) {
              final isSearching = state is SearchLoading;
              final isInitialLoading = state is SearchInitial;

              return Skeletonizer(
                enabled: isSearching || isInitialLoading,
                child: _buildSearchBody(state, isSearching, isInitialLoading),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBody(SearchState state, bool isSearching, bool isInitialLoading) {
    if (isSearching) {
      return SingleChildScrollView(
        child: SearchResultsSection(ads: CoreDummyData.dummyAdsList),
      );
    }

    if (isInitialLoading) {
      return SearchSuggestionsSection(
        history: CoreDummyData.searchHistory,
        trending: CoreDummyData.trendingKeywords,
        onSelectKeyword: (_) {},
        onDeleteHistory: (_) {},
      );
    }

    return switch (state) {
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
      _ => const SizedBox.shrink(),
    };
  }
}