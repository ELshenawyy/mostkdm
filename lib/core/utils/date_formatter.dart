abstract class DateFormatter {
  static String formatTimeAgo(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return '';

    try {
      final dateTime = DateTime.parse(dateTimeString);
      final difference = DateTime.now().difference(dateTime);

      if (difference.inSeconds < 60) {
        return 'الآن';
      } else if (difference.inMinutes < 60) {
        return 'منذ ${difference.inMinutes} د';
      } else if (difference.inHours < 24) {
        return 'منذ ${difference.inHours} س';
      } else if (difference.inDays < 30) {
        return 'منذ ${difference.inDays} يوم';
      } else {
        return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
      }
    } catch (e) {
      return dateTimeString;
    }
  }
}