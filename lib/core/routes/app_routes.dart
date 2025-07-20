/// Classe para gerenciar todas as rotas da aplicação
class AppRoutes {
  // Rotas de autenticação
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String pinValidation = '/pin-validation';

  // Rotas principais
  static const String home = '/home';
  static const String introduction = '/introduction';
  static const String initial = '/initial';

  // Rotas de perfil
  static const String profile = '/profile';
  static const String changePassword = '/change-password';
  static const String address = '/address';
  static const String payments = '/payments';
  static const String paymentHistory = '/payment-history';
  static const String paymentMethods = '/payment-methods';

  // Rotas de funcionalidades
  static const String chat = '/chat';
  static const String help = '/help';
  static const String helpDetails = '/help-details';
  static const String favorites = '/favorites';
  static const String gamification = '/gamification';
  static const String refer = '/refer';

  // Rotas de histórico
  static const String sessionHistory = '/session-history';
  static const String sessionDetails = '/session-details';
  static const String sessionReport = '/session-report';
  static const String professionalDetails = '/professional-details';

  // Rotas de compra e assinatura
  static const String purchase = '/purchase';
  static const String finalizePurchase = '/finalize-purchase';
  static const String subscription = '/subscription';
  static const String finalizeSubscription = '/finalize-subscription';

  /// Lista de todas as rotas para validação
  static const List<String> allRoutes = [
    login,
    register,
    forgotPassword,
    pinValidation,
    home,
    introduction,
    initial,
    profile,
    changePassword,
    address,
    payments,
    paymentHistory,
    paymentMethods,
    chat,
    help,
    helpDetails,
    favorites,
    gamification,
    refer,
    sessionHistory,
    sessionDetails,
    sessionReport,
    professionalDetails,
    purchase,
    finalizePurchase,
    subscription,
    finalizeSubscription,
  ];

  /// Verifica se uma rota é válida
  static bool isValidRoute(String route) {
    return allRoutes.contains(route);
  }

  /// Rotas que requerem autenticação
  static const List<String> protectedRoutes = [
    home,
    profile,
    changePassword,
    address,
    payments,
    paymentHistory,
    paymentMethods,
    chat,
    favorites,
    gamification,
    refer,
    sessionHistory,
    sessionDetails,
    sessionReport,
    professionalDetails,
    purchase,
    finalizePurchase,
    subscription,
    finalizeSubscription,
  ];

  /// Verifica se uma rota requer autenticação
  static bool isProtectedRoute(String route) {
    return protectedRoutes.contains(route);
  }

  /// Rotas públicas (não requerem autenticação)
  static const List<String> publicRoutes = [
    login,
    register,
    forgotPassword,
    pinValidation,
    introduction,
    help,
    helpDetails,
  ];

  /// Verifica se uma rota é pública
  static bool isPublicRoute(String route) {
    return publicRoutes.contains(route);
  }
}
