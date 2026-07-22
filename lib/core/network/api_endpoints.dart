class ApiEndpoints {
  static const String baseUrl = 'https://most5dem.almasader.org/api';

  // Auth
  static const String login = '/client/login';
  static const String signup = '/client/signup';
  static const String verifyOtp = '/verify-otp';
  static const String changePassword = '/change-password';
  static const String logout = '/logout';
  static const String resendOtp = '/resend-otp';

  static const String forgotPassword = '/client/forgot-password';
  static const String verifyForgotOtp = '/client/verify-forgot-otp';
  static const String resetPassword = '/client/reset-password';

  // home
  static const String home = '/flutter_home';
  static const String search = '/homes/search';
  static const String searchHistory = '/v1/homes/hestory_search';
  static const String deleteSearchHistory = '/v1/homes/delete_istory_search';
  static String deleteSearchHistoryById(int id) => '$deleteSearchHistory/$id';  
  static const String topKeyWords = '/topkeywords';

  // categories
static const String categories = '/categories';
static const String categoriesWithAdsCount = '/categories/with-ads-count';
static String categoryAds(int id) => '/categories/$id/ads';
  static String subCategories(int id) => '/categories/$id/sub-categories';
}
