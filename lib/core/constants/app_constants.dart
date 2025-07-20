/// Constantes globais da aplicação
class AppConstants {
  // API
  static const String baseUrl = 'https://api.fastmov.com';
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;

  // Storage Keys
  static const String themeKey = 'theme_mode';
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';

  // Validation
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 20;
  static const int pinLength = 4;

  // UI
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 10.0;
  static const double buttonHeight = 48.0;

  // Colors
  static const int primaryColorValue = 0xff161934;
  static const int backgroundColorValue = 0xffF1F1F1;
  static const int cardColorValue = 0xffFFFFFF;
}
