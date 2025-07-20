import 'package:flutter/material.dart';
import 'app_routes.dart';
import 'route_generator.dart';

/// Helper para navegação sem necessidade de contexto
class NavigationHelper {
  static NavigatorState? get _navigator => navigatorKey.currentState;

  /// Navega para uma nova tela
  static Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _navigator!.pushNamed<T>(routeName, arguments: arguments);
  }

  /// Navega para uma nova tela e remove a anterior
  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    Object? arguments,
    TO? result,
  }) {
    return _navigator!.pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  /// Navega para uma nova tela e remove todas as anteriores
  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) {
    return _navigator!.pushNamedAndRemoveUntil<T>(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  /// Volta para a tela anterior
  static void pop<T extends Object?>([T? result]) {
    return _navigator!.pop<T>(result);
  }

  /// Volta até uma rota específica
  static void popUntil(bool Function(Route<dynamic>) predicate) {
    return _navigator!.popUntil(predicate);
  }

  /// Verifica se pode voltar
  static bool canPop() {
    return _navigator!.canPop();
  }

  // Métodos específicos para rotas comuns

  /// Navega para login e remove todas as telas anteriores
  static Future<void> goToLogin() {
    return pushNamedAndRemoveUntil(
      AppRoutes.login,
      (route) => false,
    );
  }

  /// Navega para home e remove todas as telas anteriores
  static Future<void> goToHome() {
    return pushNamedAndRemoveUntil(
      AppRoutes.home,
      (route) => false,
    );
  }

  /// Navega para o perfil
  static Future<void> goToProfile() {
    return pushNamed(AppRoutes.profile);
  }

  /// Navega para configurações de pagamento
  static Future<void> goToPayments() {
    return pushNamed(AppRoutes.payments);
  }

  /// Navega para ajuda
  static Future<void> goToHelp() {
    return pushNamed(AppRoutes.help);
  }

  /// Navega para chat
  static Future<void> goToChat() {
    return pushNamed(AppRoutes.chat);
  }

  /// Navega para favoritos
  static Future<void> goToFavorites() {
    return pushNamed(AppRoutes.favorites);
  }

  /// Navega para histórico de sessões
  static Future<void> goToSessionHistory() {
    return pushNamed(AppRoutes.sessionHistory);
  }

  /// Navega para detalhes de sessão
  static Future<void> goToSessionDetails({Object? arguments}) {
    return pushNamed(AppRoutes.sessionDetails, arguments: arguments);
  }

  /// Navega para detalhes do profissional
  static Future<void> goToProfessionalDetails({Object? arguments}) {
    return pushNamed(AppRoutes.professionalDetails, arguments: arguments);
  }

  /// Navega para compra de sessão
  static Future<void> goToPurchase({Object? arguments}) {
    return pushNamed(AppRoutes.purchase, arguments: arguments);
  }

  /// Navega para assinatura
  static Future<void> goToSubscription() {
    return pushNamed(AppRoutes.subscription);
  }

  /// Navega para cadastro
  static Future<void> goToRegister() {
    return pushNamed(AppRoutes.register);
  }

  /// Navega para esqueceu senha
  static Future<void> goToForgotPassword() {
    return pushNamed(AppRoutes.forgotPassword);
  }

  /// Navega para validação de PIN
  static Future<void> goToPinValidation({Object? arguments}) {
    return pushNamed(AppRoutes.pinValidation, arguments: arguments);
  }

  /// Volta para a tela anterior com resultado
  static void goBack<T>([T? result]) {
    pop<T>(result);
  }

  /// Mostra um dialog de confirmação antes de sair
  static Future<bool> showExitConfirmation(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sair do App'),
        content: const Text('Tem certeza que deseja sair?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Sair'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  /// Mostra um snackbar de erro
  static void showError(String message) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  /// Mostra um snackbar de sucesso
  static void showSuccess(String message) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  /// Mostra um snackbar de informação
  static void showInfo(String message) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
