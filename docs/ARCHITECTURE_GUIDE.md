# 🏗️ Guia de Arquitetura FastMov

## 📋 Índice
1. [Visão Geral da Arquitetura](#visão-geral)
2. [Como Implementar APIs](#implementar-apis)
3. [Gerenciamento de Estado com MobX](#gerenciamento-estado)
4. [Fluxo de Dados](#fluxo-dados)
5. [Exemplos Práticos](#exemplos-práticos)

## 🎯 Visão Geral da Arquitetura

### Clean Architecture - 4 Camadas

```
┌─────────────────────────────────────────────────────────┐
│                    PRESENTATION                         │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐     │
│  │   Screens   │  │   Stores    │  │   Widgets   │     │
│  │             │  │   (MobX)    │  │             │     │
│  └─────────────┘  └─────────────┘  └─────────────┘     │
└─────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│                      DOMAIN                             │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐     │
│  │  Entities   │  │  Use Cases  │  │ Repositories│     │
│  │             │  │             │  │ (Abstract)  │     │
│  └─────────────┘  └─────────────┘  └─────────────┘     │
└─────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│                       DATA                              │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐     │
│  │   Models    │  │ Repositories│  │ Data Sources│     │
│  │             │  │ (Concrete)  │  │             │     │
│  └─────────────┘  └─────────────┘  └─────────────┘     │
└─────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│                       CORE                              │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐     │
│  │   Utils     │  │   Errors    │  │ Constants   │     │
│  │             │  │             │  │             │     │
│  └─────────────┘  └─────────────┘  └─────────────┘     │
└─────────────────────────────────────────────────────────┘
```

## 🌐 Como Implementar APIs

### Passo 1: Criar o Data Source Remoto

```dart
// lib/data/datasources/remote/user_remote_datasource.dart
abstract class UserRemoteDataSource {
  Future<UserModel> getUser(String id);
  Future<List<UserModel>> getUsers();
  Future<UserModel> createUser(CreateUserRequest request);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;
  
  UserRemoteDataSourceImpl({required this.dio});
  
  @override
  Future<UserModel> getUser(String id) async {
    try {
      final response = await dio.get('/users/$id');
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure(
        message: e.response?.data['message'] ?? 'Erro no servidor',
        code: e.response?.statusCode,
      );
    }
  }
}
```

### Passo 2: Configurar o Dio no DI

```dart
// lib/core/di/injection_container.dart
Future<void> init() async {
  // Dio configuration
  sl.registerLazySingleton(() {
    final dio = Dio();
    dio.options.baseUrl = AppConstants.baseUrl;
    dio.options.connectTimeout = Duration(milliseconds: AppConstants.connectionTimeout);
    dio.options.receiveTimeout = Duration(milliseconds: AppConstants.receiveTimeout);
    
    // Interceptors
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    dio.interceptors.add(AuthInterceptor()); // Para adicionar tokens
    
    return dio;
  });
  
  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(dio: sl()),
  );
}
```

### Passo 3: Implementar o Repository

```dart
// lib/data/repositories/user_repository_impl.dart
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, User>> getUser(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.getUser(id);
        await localDataSource.cacheUser(userModel);
        return Right(userModel.toEntity());
      } on ServerFailure catch (e) {
        return Left(e);
      }
    } else {
      try {
        final userModel = await localDataSource.getCachedUser(id);
        return Right(userModel.toEntity());
      } on CacheFailure catch (e) {
        return Left(e);
      }
    }
  }
}
```

## 🔄 Gerenciamento de Estado com MobX

### Estrutura de um Store

```dart
// lib/presentation/stores/user/user_store.dart
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final GetUserUseCase getUserUseCase;
  final UpdateUserUseCase updateUserUseCase;

  _UserStoreBase({
    required this.getUserUseCase,
    required this.updateUserUseCase,
  });

  // Observables - Estado
  @observable
  User? currentUser;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  ObservableList<User> users = ObservableList<User>();

  // Actions - Métodos que modificam o estado
  @action
  Future<void> loadUser(String id) async {
    isLoading = true;
    errorMessage = null;

    final result = await getUserUseCase(GetUserParams(id: id));
    
    result.fold(
      (failure) {
        errorMessage = failure.message;
        currentUser = null;
      },
      (user) {
        currentUser = user;
        errorMessage = null;
      },
    );

    isLoading = false;
  }

  @action
  Future<bool> updateUser(User user) async {
    isLoading = true;
    errorMessage = null;

    final result = await updateUserUseCase(UpdateUserParams(user: user));
    
    return result.fold(
      (failure) {
        errorMessage = failure.message;
        return false;
      },
      (updatedUser) {
        currentUser = updatedUser;
        // Atualiza na lista também
        final index = users.indexWhere((u) => u.id == updatedUser.id);
        if (index != -1) {
          users[index] = updatedUser;
        }
        return true;
      },
    );
  }

  // Computed - Valores derivados
  @computed
  bool get hasUser => currentUser != null;

  @computed
  String get userName => currentUser?.name ?? 'Usuário';

  @computed
  bool get canEdit => hasUser && !isLoading;
}
```

### Como Usar o Store na UI

```dart
// lib/presentation/screens/user/user_screen.dart
class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late final UserStore userStore;

  @override
  void initState() {
    super.initState();
    userStore = sl<UserStore>();
    userStore.loadUser('123'); // Carrega o usuário
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil do Usuário')),
      body: Observer(
        builder: (_) {
          if (userStore.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (userStore.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Erro: ${userStore.errorMessage}'),
                  ElevatedButton(
                    onPressed: () => userStore.loadUser('123'),
                    child: Text('Tentar Novamente'),
                  ),
                ],
              ),
            );
          }

          if (!userStore.hasUser) {
            return Center(child: Text('Usuário não encontrado'));
          }

          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  userStore.userName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(userStore.currentUser!.email),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: userStore.canEdit ? _editUser : null,
                  child: Text('Editar Perfil'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _editUser() {
    // Lógica para editar usuário
  }
}
```

## 🔄 Fluxo de Dados

### 1. User Interaction → Store
```
UI Event (tap, input) → Store Action → Use Case → Repository → Data Source → API
```

### 2. API Response → UI Update
```
API Response → Data Source → Repository → Use Case → Store → Observer → UI Update
```

### Exemplo Completo de Fluxo:

1. **Usuário clica em "Carregar Perfil"**
2. **UI chama** `userStore.loadUser('123')`
3. **Store executa** `getUserUseCase(GetUserParams(id: '123'))`
4. **Use Case valida** parâmetros e chama `repository.getUser('123')`
5. **Repository verifica** conectividade e chama `remoteDataSource.getUser('123')`
6. **Data Source faz** requisição HTTP para `/users/123`
7. **API retorna** dados do usuário
8. **Data Source converte** JSON para `UserModel`
9. **Repository converte** `UserModel` para `User` entity
10. **Use Case retorna** `Right(user)` para o Store
11. **Store atualiza** `currentUser` e `isLoading = false`
12. **Observer detecta** mudança e reconstrói a UI
13. **UI mostra** dados do usuário

## 📝 Dicas Importantes

### Para APIs:
- Sempre use try-catch nos Data Sources
- Implemente cache local para offline
- Use interceptors do Dio para logs e autenticação
- Valide dados antes de enviar para API

### Para MobX:
- Use `@observable` para estado que a UI precisa observar
- Use `@action` para métodos que modificam observables
- Use `@computed` para valores derivados
- Sempre envolva widgets que dependem do store com `Observer`

### Para Testes:
- Mock os Use Cases nos testes de Store
- Mock os Repositories nos testes de Use Case
- Use `when()` do Mockito para simular respostas

## 🚀 Exemplo Prático: Implementando uma Nova Feature

### Cenário: Sistema de Notificações

#### 1. Criar a Entity
```dart
// lib/domain/entities/notification.dart
class Notification extends Equatable {
  final String id;
  final String title;
  final String message;
  final DateTime createdAt;
  final bool isRead;

  const Notification({
    required this.id,
    required this.title,
    required this.message,
    required this.createdAt,
    this.isRead = false,
  });

  @override
  List<Object> get props => [id, title, message, createdAt, isRead];
}
```

#### 2. Criar o Repository
```dart
// lib/domain/repositories/notification_repository.dart
abstract class NotificationRepository {
  Future<Either<Failure, List<Notification>>> getNotifications();
  Future<Either<Failure, bool>> markAsRead(String id);
}
```

#### 3. Criar o Use Case
```dart
// lib/domain/usecases/notification/get_notifications_usecase.dart
class GetNotificationsUseCase implements NoParamsUseCase<List<Notification>> {
  final NotificationRepository repository;

  GetNotificationsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Notification>>> call() async {
    return await repository.getNotifications();
  }
}
```

#### 4. Implementar o Data Source
```dart
// lib/data/datasources/remote/notification_remote_datasource.dart
class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final Dio dio;

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final response = await dio.get('/notifications');
    return (response.data as List)
        .map((json) => NotificationModel.fromJson(json))
        .toList();
  }
}
```

#### 5. Criar o Store
```dart
// lib/presentation/stores/notification/notification_store.dart
class NotificationStore = _NotificationStoreBase with _$NotificationStore;

abstract class _NotificationStoreBase with Store {
  final GetNotificationsUseCase getNotificationsUseCase;

  @observable
  ObservableList<Notification> notifications = ObservableList<Notification>();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadNotifications() async {
    isLoading = true;
    final result = await getNotificationsUseCase();
    result.fold(
      (failure) => print('Error: ${failure.message}'),
      (notificationList) => notifications.addAll(notificationList),
    );
    isLoading = false;
  }

  @computed
  int get unreadCount => notifications.where((n) => !n.isRead).length;
}
```

#### 6. Usar na UI
```dart
// lib/presentation/screens/notifications/notifications_screen.dart
class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late final NotificationStore notificationStore;

  @override
  void initState() {
    super.initState();
    notificationStore = sl<NotificationStore>();
    notificationStore.loadNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(
            'Notificações (${notificationStore.unreadCount})',
          ),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (notificationStore.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: notificationStore.notifications.length,
            itemBuilder: (context, index) {
              final notification = notificationStore.notifications[index];
              return ListTile(
                title: Text(notification.title),
                subtitle: Text(notification.message),
                trailing: notification.isRead
                    ? null
                    : Icon(Icons.circle, color: Colors.blue, size: 12),
              );
            },
          );
        },
      ),
    );
  }
}
```

## 📚 Recursos de Aprendizado

### Documentação Oficial
- [MobX Flutter](https://mobx.netlify.app/getting-started/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Architecture](https://docs.flutter.dev/development/data-and-backend/state-mgmt/options)

### Padrões Recomendados
1. **Sempre use Either para retornos de Use Cases**
2. **Mantenha as Entities puras (sem dependências externas)**
3. **Use Observers apenas onde necessário**
4. **Teste cada camada independentemente**
5. **Mantenha os Stores focados em uma responsabilidade**

### Estrutura de Commits
```
feat: add notification system
fix: correct theme colors in dark mode
refactor: improve error handling in auth store
test: add unit tests for login use case
docs: update architecture guide
```
