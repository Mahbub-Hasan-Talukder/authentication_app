class API{
  static const String baseURL = 'http://34.72.136.54:4067';
  static const String signup = '$baseURL/api/v1/auth/signUp';
  static const String login = '$baseURL/api/v1/auth/login';
  static const String logout = '$baseURL/api/v1/auth/logout';
  static const String resendOtp = '$baseURL/api/v1/auth/resend-otp';
  static const String verifyOtp = '$baseURL/api/v1/auth/verifyOtp';
  static const String forgetPassword = '$baseURL/api/v1/auth/forget-password';
  static const String setNewPassword = '$baseURL/api/v1/auth/set-new-password';
  static const String update = '$baseURL/api/v1/auth/me';
  static const String me = '$baseURL/api/v1/auth/me';
}