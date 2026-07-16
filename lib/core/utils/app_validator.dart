class AppValidators {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) return 'هذا الحقل مطلوب';
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return 'هذا الحقل مطلوب';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'البريد الإلكتروني غير صحيح';
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) return 'هذا الحقل مطلوب';
    if (value.length < 9) return 'رقم الهاتف غير صحيح';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) return 'هذا الحقل مطلوب';
    if (value.length < 8) return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.trim().isEmpty) return 'هذا الحقل مطلوب';
    if (value != password) return 'كلمة المرور غير متطابقة';
    return null;
  }
}