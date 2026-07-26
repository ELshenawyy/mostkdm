import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/features/search/data/models/search_history_item.dart';
import 'package:mostkdm/features/search/presentation/widget/search_history_item.dart';

class SearchSuggestionsSection extends StatelessWidget {
  final List<SearchHistoryItem> history;
  final List<String> trending;
  final void Function(String keyword) onSelectKeyword;
  final void Function(int id) onDeleteHistory;

  const SearchSuggestionsSection({
    super.key,
    required this.history,
    required this.trending,
    required this.onSelectKeyword,
    required this.onDeleteHistory,
  });

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty && trending.isEmpty) {
      return const Center(
        child: Text('ابحث عن إعلان', style: AppTextStyle.headline2),
      );
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        if (history.isNotEmpty) ...[
          Text('عمليات البحث الأخيرة', style: AppTextStyle.headline3),
          const SizedBox(height: 12),
          ...history.map(
            (item) => SearchHistoryItemTile(
              keyword: item.keyword,
              onTap: () => onSelectKeyword(item.keyword),
              onDelete: () => onDeleteHistory(item.id),
            ),
          ),
          const SizedBox(height: 20),
        ],
        if (trending.isNotEmpty) ...[
          Row(
            children: [
              Text('الأكثر بحثاً', style: AppTextStyle.headline3),
              const SizedBox(width: 6),
              const Icon(Icons.trending_up,
                  size: 18, color: AppColors.primaryColor),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: trending
                .map(
                  (keyword) => GestureDetector(
                    onTap: () => onSelectKeyword(keyword),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.ghostBtnBorder),
                      ),
                      child:
                          Text(keyword, style: AppTextStyle.textFieldLabel),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
  }
}