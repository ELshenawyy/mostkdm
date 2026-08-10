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
  static String categoryAds(int categoryId) => '/categories/$categoryId/ads';
  static String subCategories(int id) => '/categories/$id/sub-categories';
  static const String cities = '/v1/cities';
  static const String adsFilter = '/ads/filter';

  // ads
  static const String ads = '/ads';
  static const String allAds = '/v1/ads';
  static String adDetails(String id) => '/ads/$id';
  
  // add & edit 
  static const String myAds = '/v1/user/ads';
  static String toggleAdActive(int id) => '/v1/ads/$id/toggle-active';
  static String userAd(int id) => '/v1/ads/$id';

  static const String createAd = '/v1/ads';


  // notification
  static const String notifications = '/notifications';
  static const String notificationsCount = '/notifications-count';
  static const String markAllAsRead = '/notifications/mark-all-read';
  static String deleteNotification(String id) => '/notifications/$id';
  static const String deleteAllNotifications = '/notifications/all';

  // chat
  static const String getChats = '/v1/chats';
  static const String sendMessage = '/v1/chats/send-message';
  static String getMessages(int roomId) => '/v1/chats/$roomId/messages';

  // wallet
  static const String walletBalance = '/v1/wallet';
  static const String walletTransactions = '/v1/wallet/transactions';
  static const String rechargeWallet = '/v1/wallet/recharge';


  // commission
  static const String calculateCommission = '/v1/ads/calculate-commission';
  static const String payCommission = '/v1/ads/pay-commission';

  // packages
  static const String packages = '/v1/packages';

  // subscriptions
  static const String subscriptions = '/v1/subscriptions/store';


}
