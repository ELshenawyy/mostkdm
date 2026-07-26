import 'package:equatable/equatable.dart';
class SearchHistoryItem extends Equatable {
  final int id;
  final String keyword;

  const SearchHistoryItem({
    required this.id,
    required this.keyword,
  });

  factory SearchHistoryItem.fromJson(Map<String, dynamic> json) {
    return SearchHistoryItem(
      id: json['id'] is int
          ? json['id']
          : (int.tryParse(json['id']?.toString() ?? '') ?? 0),
      keyword: json['keyword']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [id, keyword];
}