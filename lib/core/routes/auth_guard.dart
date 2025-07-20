import 'package:flutter/material.dart';

import '../di/injection_container.dart';
import '../../presentation/stores/auth/auth_store.dart';
import 'app_routes.dart';
import 'navigation_helper.dart';

/// Guard para verificar autenticação antes de navegar para rotas protegidas
class AuthGuard {
  static final AuthStore _authStore = sl<AuthStore>();

  /// Verifica se o usuário está autenticado
  static bool get isAuthenticated => _authStore.isLoggedIn;

  /// Verifica se pode acessar uma rota
  static bool canAccess(String route) {
    // Se a rota é pública, sempre pode acessar
    if (AppRoutes.isPublicRoute(route)) {
      return true;
    }

    // Se a rota é protegida, verifica autenticação
    if (AppRoutes.isProtectedRoute(route)) {
      return isAuthenticated;
    }

    // Para rotas não categorizadas, permite acesso
    return true;
  }

  /// Middleware para verificar autenticação antes da navegação
  static Route<dynamic>? checkAuthAndNavigate(RouteSettings settings) {
    final String routeName = settings.name ?? '';

    // Se não pode acessar a rota, redireciona para login
    if (!canAccess(routeName)) {
      return _createRedirectRoute();
    }

    // Se está autenticado e tentando acessar login, redireciona para home
    if (isAuthenticated && routeName == AppRoutes.login) {
      return _createHomeRedirectRoute();
    }

    return null; // Permite navegação normal
  }

  /// Cria uma rota de redirecionamento para login
  static Route<dynamic> _createRedirectRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        // Mostra uma tela de loading enquanto redireciona
        return const _AuthRedirectScreen();
      },
      transitionDuration: Duration.zero,
    );
  }

  /// Cria uma rota de redirecionamento para home
  static Route<dynamic> _createHomeRedirectRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        // Mostra uma tela de loading enquanto redireciona
        return const _HomeRedirectScreen();
      },
      transitionDuration: Duration.zero,
    );
  }

  /// Força logout e redireciona para login
  static void forceLogout() {
    _authStore.logout();
    NavigationHelper.goToLogin();
  }

  /// Verifica se o token ainda é válido (implementar quando tiver API real)
  static Future<bool> validateToken() async {
    // TODO: Implementar validação de token com API
    // Por enquanto, apenas verifica se está logado
    return isAuthenticated;
  }
}

/// Tela de redirecionamento para login
class _AuthRedirectScreen extends StatefulWidget {
  const _AuthRedirectScreen();

  @override
  State<_AuthRedirectScreen> createState() => _AuthRedirectScreenState();
}

class _AuthRedirectScreenState extends State<_AuthRedirectScreen> {
  @override
  void initState() {
    super.initState();
    // Redireciona após o build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NavigationHelper.goToLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Redirecionando para login...'),
          ],
        ),
      ),
    );
  }
}

/// Tela de redirecionamento para home
class _HomeRedirectScreen extends StatefulWidget {
  const _HomeRedirectScreen();

  @override
  State<_HomeRedirectScreen> createState() => _HomeRedirectScreenState();
}

class _HomeRedirectScreenState extends State<_HomeRedirectScreen> {
  @override
  void initState() {
    super.initState();
    // Redireciona após o build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NavigationHelper.goToHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Redirecionando...'),
          ],
        ),
      ),
    );
  }
}

/// Widget para proteger rotas específicas
class ProtectedRoute extends StatelessWidget {
  final Widget child;
  final String? redirectRoute;

  const ProtectedRoute({
    super.key,
    required this.child,
    this.redirectRoute,
  });

  @override
  Widget build(BuildContext context) {
    if (!AuthGuard.isAuthenticated) {
      // Se não está autenticado, redireciona
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (redirectRoute != null) {
          NavigationHelper.pushReplacementNamed(redirectRoute!);
        } else {
          NavigationHelper.goToLogin();
        }
      });

      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return child;
  }
}

/// Mixin para telas que precisam de autenticação
mixin AuthRequiredMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  void _checkAuth() {
    if (!AuthGuard.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        NavigationHelper.goToLogin();
      });
    }
  }
}

/// Mixin para telas que não devem ser acessadas quando autenticado
mixin GuestOnlyMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  void _checkAuth() {
    if (AuthGuard.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        NavigationHelper.goToHome();
      });
    }
  }
}
