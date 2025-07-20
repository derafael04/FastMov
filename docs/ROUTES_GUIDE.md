# 🛣️ Guia de Rotas - FastMov

## 🎯 Sistema de Rotas Implementado

O projeto agora possui um **sistema de rotas centralizado e organizado** com:

### ✅ **Funcionalidades Implementadas:**
- **Rotas centralizadas** em `AppRoutes`
- **Gerador de rotas** automático
- **Navegação sem contexto** via `NavigationHelper`
- **Proteção de rotas** com `AuthGuard`
- **Transições personalizadas**
- **Tratamento de erros** para rotas não encontradas

## 📁 Estrutura de Arquivos

```
lib/core/routes/
├── app_routes.dart          # Definição de todas as rotas
├── route_generator.dart     # Gerador de rotas
├── navigation_helper.dart   # Helper para navegação
└── auth_guard.dart         # Proteção de rotas
```

## 🗺️ Rotas Disponíveis

### **Autenticação**
```dart
AppRoutes.login              // '/login'
AppRoutes.register           // '/register'
AppRoutes.forgotPassword     // '/forgot-password'
AppRoutes.pinValidation      // '/pin-validation'
```

### **Principais**
```dart
AppRoutes.home               // '/home'
AppRoutes.introduction       // '/introduction'
AppRoutes.initial            // '/initial'
```

### **Perfil**
```dart
AppRoutes.profile            // '/profile'
AppRoutes.changePassword     // '/change-password'
AppRoutes.address            // '/address'
AppRoutes.payments           // '/payments'
AppRoutes.paymentHistory     // '/payment-history'
AppRoutes.paymentMethods     // '/payment-methods'
```

### **Funcionalidades**
```dart
AppRoutes.chat               // '/chat'
AppRoutes.help               // '/help'
AppRoutes.helpDetails        // '/help-details'
AppRoutes.favorites          // '/favorites'
AppRoutes.gamification       // '/gamification'
AppRoutes.refer              // '/refer'
```

### **Histórico**
```dart
AppRoutes.sessionHistory     // '/session-history'
AppRoutes.sessionDetails     // '/session-details'
AppRoutes.sessionReport      // '/session-report'
AppRoutes.professionalDetails // '/professional-details'
```

### **Compra e Assinatura**
```dart
AppRoutes.purchase           // '/purchase'
AppRoutes.finalizePurchase   // '/finalize-purchase'
AppRoutes.subscription       // '/subscription'
AppRoutes.finalizeSubscription // '/finalize-subscription'
```

## 🚀 Como Usar

### 1. **Navegação Básica**
```dart
// Em vez de:
Navigator.pushNamed(context, '/profile');

// Use:
NavigationHelper.goToProfile();
```

### 2. **Navegação com Argumentos**
```dart
// Passar argumentos
NavigationHelper.pushNamed(
  AppRoutes.sessionDetails,
  arguments: sessionData,
);

// Receber argumentos na tela
class SessionDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sessionData = ModalRoute.of(context)?.settings.arguments as SessionData?;
    // usar sessionData
  }
}
```

### 3. **Navegação com Substituição**
```dart
// Substitui a tela atual
NavigationHelper.pushReplacementNamed(AppRoutes.home);

// Remove todas as telas anteriores
NavigationHelper.goToHome(); // Equivale a pushNamedAndRemoveUntil
```

### 4. **Navegação Condicional**
```dart
// Verifica autenticação antes de navegar
if (AuthGuard.isAuthenticated) {
  NavigationHelper.goToProfile();
} else {
  NavigationHelper.goToLogin();
}
```

## 🔒 Proteção de Rotas

### **Rotas Protegidas** (Requerem autenticação)
- Todas as rotas de perfil
- Chat, favoritos, gamificação
- Histórico de sessões
- Compras e assinaturas

### **Rotas Públicas** (Não requerem autenticação)
- Login, registro, esqueceu senha
- Introdução, ajuda

### **Uso do AuthGuard**
```dart
// Verificar se pode acessar uma rota
if (AuthGuard.canAccess(AppRoutes.profile)) {
  NavigationHelper.goToProfile();
}

// Forçar logout
AuthGuard.forceLogout();

// Validar token (para implementar com API)
final isValid = await AuthGuard.validateToken();
```

## 🎨 Transições Personalizadas

### **Transição Padrão** (Slide da direita)
```dart
// Todas as rotas usam por padrão
NavigationHelper.goToProfile();
```

### **Transições Customizadas**
```dart
// No RouteGenerator, você pode personalizar:
static PageRoute<dynamic> _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Personalizar transição aqui
      return SlideTransition(
        position: animation.drive(
          Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeInOut)),
        ),
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: 300),
  );
}
```

## 🛠️ Exemplos Práticos

### **1. Tela de Login**
```dart
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Campos de login...
          
          ElevatedButton(
            onPressed: () async {
              final success = await authStore.login();
              if (success) {
                NavigationHelper.goToHome();
              }
            },
            child: Text('Entrar'),
          ),
          
          TextButton(
            onPressed: () => NavigationHelper.goToRegister(),
            child: Text('Criar conta'),
          ),
          
          TextButton(
            onPressed: () => NavigationHelper.goToForgotPassword(),
            child: Text('Esqueceu a senha?'),
          ),
        ],
      ),
    );
  }
}
```

### **2. Drawer/Menu**
```dart
class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.pop(context); // Fecha o drawer
              NavigationHelper.goToProfile();
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Pagamentos'),
            onTap: () {
              Navigator.pop(context);
              NavigationHelper.goToPayments();
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Ajuda'),
            onTap: () {
              Navigator.pop(context);
              NavigationHelper.goToHelp();
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
            onTap: () {
              AuthGuard.forceLogout();
            },
          ),
        ],
      ),
    );
  }
}
```

### **3. Bottom Navigation**
```dart
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        // Já está na home
        break;
      case 1:
        NavigationHelper.goToFavorites();
        break;
      case 2:
        NavigationHelper.goToSessionHistory();
        break;
      case 3:
        NavigationHelper.goToProfile();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Histórico'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
      body: _buildCurrentPage(),
    );
  }
}
```

## 🔧 Configuração no main.dart

```dart
MaterialApp(
  navigatorKey: navigatorKey,           // Para navegação sem contexto
  initialRoute: AppRoutes.login,        // Rota inicial
  onGenerateRoute: RouteGenerator.generateRoute, // Gerador de rotas
  onUnknownRoute: (settings) => RouteGenerator.generateRoute(
    RouteSettings(name: '/error', arguments: settings.arguments),
  ),
)
```

## 🧪 Testando Rotas

```dart
testWidgets('should navigate to profile when button is pressed', (tester) async {
  await tester.pumpWidget(MyApp());
  
  // Simular login
  authStore.isLoggedIn = true;
  
  // Encontrar e tocar no botão
  await tester.tap(find.text('Perfil'));
  await tester.pumpAndSettle();
  
  // Verificar se navegou
  expect(find.byType(ProfileScreen), findsOneWidget);
});
```

## ✅ Benefícios do Sistema

1. **Centralização**: Todas as rotas em um lugar
2. **Type Safety**: Constantes em vez de strings mágicas
3. **Navegação Simples**: Métodos helper intuitivos
4. **Proteção**: Rotas protegidas automaticamente
5. **Manutenibilidade**: Fácil de modificar e estender
6. **Debugging**: Logs automáticos de navegação
7. **Tratamento de Erros**: Páginas de erro personalizadas

## 🚀 Próximos Passos

1. **Implementar deep linking** para URLs específicas
2. **Adicionar animações** personalizadas por rota
3. **Implementar cache** de rotas visitadas
4. **Adicionar analytics** de navegação
5. **Criar rotas dinâmicas** baseadas em permissões
