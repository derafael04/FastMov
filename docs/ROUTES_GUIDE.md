# 🛣️ Guia de Rotas - FastMov (Simplificado)

## 🎯 Sistema de Rotas Tradicional

O projeto usa o **sistema tradicional de rotas do Flutter** de forma organizada:

### ✅ **Funcionalidades:**
- **Rotas definidas no main.dart** (padrão Flutter)
- **Constantes centralizadas** em `Routes`
- **Navegação simples** com `Navigator`
- **Fácil manutenção** e compreensão

## 📁 Estrutura Simplificada

```
lib/
├── core/constants/routes.dart   # Constantes das rotas
└── main.dart                   # Definição das rotas
```

## 🗺️ Rotas Disponíveis

### **Autenticação**
```dart
Routes.login              // '/login'
Routes.register           // '/register'
Routes.forgotPassword     // '/forgot-password'
Routes.pinValidation      // '/pin-validation'
```

### **Principais**
```dart
Routes.home               // '/home'
Routes.introduction       // '/introduction'
Routes.initial            // '/initial'
```

### **Perfil**
```dart
Routes.profile            // '/profile'
Routes.changePassword     // '/change-password'
Routes.address            // '/address'
Routes.payments           // '/payments'
Routes.paymentHistory     // '/payment-history'
Routes.paymentMethods     // '/payment-methods'
```

### **Funcionalidades**
```dart
Routes.chat               // '/chat'
Routes.help               // '/help'
Routes.favorites          // '/favorites'
Routes.gamification       // '/gamification'
Routes.refer              // '/refer'
```

### **Histórico**
```dart
Routes.sessionHistory     // '/session-history'
Routes.sessionDetails     // '/session-details'
Routes.sessionReport      // '/session-report'
Routes.professionalDetails // '/professional-details'
```

### **Compra e Assinatura**
```dart
Routes.purchase           // '/purchase'
Routes.finalizePurchase   // '/finalize-purchase'
Routes.subscription       // '/subscription'
Routes.finalizeSubscription // '/finalize-subscription'
```

## 🚀 Como Usar

### 1. **Navegação Básica**
```dart
// Navegar para uma nova tela
Navigator.pushNamed(context, Routes.profile);

// Navegar e substituir a tela atual
Navigator.pushReplacementNamed(context, Routes.home);

// Navegar e remover todas as telas anteriores
Navigator.pushNamedAndRemoveUntil(
  context,
  Routes.home,
  (route) => false,
);
```

### 2. **Navegação com Argumentos**
```dart
// Passar argumentos
Navigator.pushNamed(
  context,
  Routes.sessionDetails,
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

### 3. **Voltar para tela anterior**
```dart
// Voltar simples
Navigator.pop(context);

// Voltar com resultado
Navigator.pop(context, result);

// Verificar se pode voltar
if (Navigator.canPop(context)) {
  Navigator.pop(context);
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

## ✅ Benefícios do Sistema Simplificado

1. **Simplicidade**: Sistema tradicional do Flutter, fácil de entender
2. **Type Safety**: Constantes em vez de strings mágicas
3. **Manutenibilidade**: Todas as rotas em um lugar (main.dart)
4. **Performance**: Sem overhead de sistemas complexos
5. **Debugging**: Fácil de debugar e modificar
6. **Padrão Flutter**: Segue as convenções oficiais

## 🔧 Configuração no main.dart

```dart
MaterialApp(
  initialRoute: Routes.login,
  routes: {
    Routes.login: (context) => const TelaLoginInicial(),
    Routes.home: (context) => const Home(),
    Routes.profile: (context) => const TelaPerfil(),
    // ... outras rotas
  },
)
```

## 📝 Exemplo Prático Completo

```dart
// 1. Definir constante (já feito em Routes)
class Routes {
  static const String profile = '/profile';
}

// 2. Configurar no main.dart (já feito)
routes: {
  Routes.profile: (context) => const TelaPerfil(),
}

// 3. Usar na navegação
ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, Routes.profile);
  },
  child: Text('Ir para Perfil'),
)

// 4. Receber argumentos (se necessário)
class TelaPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(/* ... */);
  }
}
```

## 🎯 Resultado Final

✅ **Sistema simples e eficiente**
✅ **32 rotas organizadas**
✅ **Constantes centralizadas**
✅ **Navegação tradicional do Flutter**
✅ **Fácil manutenção**
✅ **Performance otimizada**
