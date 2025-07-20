import '../../../core/errors/failures.dart';
import '../../models/user_model.dart';

/// Interface para data source remoto de autenticação
abstract class AuthRemoteDataSource {
  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  });

  Future<bool> validatePin({
    required String pin,
    required String userId,
  });

  Future<bool> forgotPassword({
    required String email,
  });
}

/// Implementação mock do data source remoto de autenticação
/// Em produção, usaria Dio ou http para fazer chamadas reais para API
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    // Simula delay de rede
    await Future.delayed(const Duration(seconds: 2));

    // Mock - simula login bem-sucedido
    if (email == 'user@fastmov.com' && password == '123456') {
      return UserModel(
        id: '1',
        name: 'Rafael Silva',
        email: email,
        phone: '(11) 99999-9999',
        profileImage: null,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        updatedAt: DateTime.now(),
      );
    }

    // Simula erro de credenciais inválidas
    throw const AuthFailure(
      message: 'Email ou senha incorretos',
      code: 401,
    );
  }

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    // Simula delay de rede
    await Future.delayed(const Duration(seconds: 2));

    // Mock - simula registro bem-sucedido
    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      phone: phone,
      profileImage: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<bool> validatePin({
    required String pin,
    required String userId,
  }) async {
    // Simula delay de rede
    await Future.delayed(const Duration(seconds: 1));

    // Mock - aceita qualquer PIN com 4 dígitos
    return pin.length == 4 && RegExp(r'^\d+$').hasMatch(pin);
  }

  @override
  Future<bool> forgotPassword({
    required String email,
  }) async {
    // Simula delay de rede
    await Future.delayed(const Duration(seconds: 1));

    // Mock - sempre retorna sucesso
    return true;
  }
}
