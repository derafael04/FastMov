import '../../core/errors/failures.dart';
import '../../core/utils/either.dart';
import '../entities/user.dart';

/// Repository abstrato para autenticação
abstract class AuthRepository {
  /// Realiza login do usuário
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  /// Registra um novo usuário
  Future<Either<Failure, User>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  });

  /// Valida PIN de verificação
  Future<Either<Failure, bool>> validatePin({
    required String pin,
    required String userId,
  });

  /// Esqueceu a senha
  Future<Either<Failure, bool>> forgotPassword({
    required String email,
  });

  /// Logout do usuário
  Future<Either<Failure, bool>> logout();

  /// Verifica se o usuário está logado
  Future<Either<Failure, bool>> isLoggedIn();

  /// Obtém o usuário atual
  Future<Either<Failure, User?>> getCurrentUser();

  /// Salva o token de autenticação
  Future<Either<Failure, bool>> saveAuthToken(String token);

  /// Obtém o token de autenticação
  Future<Either<Failure, String?>> getAuthToken();

  /// Remove o token de autenticação
  Future<Either<Failure, bool>> removeAuthToken();
}
