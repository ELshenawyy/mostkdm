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
}
