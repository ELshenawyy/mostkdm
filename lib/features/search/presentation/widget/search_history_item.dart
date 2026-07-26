import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';

/// A single row in "عمليات البحث الأخيرة".
/// Pure UI -- doesn't know about Bloc/Repository, just renders a keyword
/// and reports taps back via callbacks.
///
/// NOTE: renamed from search_history_item.dart -> search_history_item_tile.dart
/// so the filename can't be confused with the data model
/// `SearchHistoryItem` in data/models/search_history_item.dart.
class SearchHistoryItemTile extends StatelessWidget {
  final String keyword;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const SearchHistoryItemTile({
    super.key,
    required this.keyword,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.ghostBtnBorder),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: onDelete,
              child: const Icon(
                Icons.close,
                size: 18,
                color: AppColors.textHintColor,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                keyword,
                textAlign: TextAlign.right,
                style: AppTextStyle.textFieldLabel,
              ),
            ),
            const Icon(
              Icons.access_time,
              size: 18,
              color: AppColors.textHintColor,
            ),
          ],
        ),
      ),
    );
  }
}