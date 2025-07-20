import 'dart:convert';

import '../../core/errors/failures.dart';
import '../../core/network/network_info.dart';
import '../../core/utils/either.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local/local_storage.dart';
import '../datasources/remote/auth_remote_datasource.dart';
import '../models/user_model.dart';

/// Implementação do repository de autenticação
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final LocalStorage localStorage;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localStorage,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final userModel = await remoteDataSource.login(
          email: email,
          password: password,
        );

        // Salva dados do usuário localmente
        await localStorage.saveUserData(jsonEncode(userModel.toJson()));
        await localStorage.saveAuthToken('mock_token_${userModel.id}');

        return Right(userModel.toEntity());
      } else {
        return const Left(NetworkFailure(
          message: 'Sem conexão com a internet',
        ));
      }
    } on AuthFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GenericFailure(
        message: 'Erro inesperado: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<Failure, User>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final userModel = await remoteDataSource.register(
          name: name,
          email: email,
          password: password,
          phone: phone,
        );

        // Salva dados do usuário localmente
        await localStorage.saveUserData(jsonEncode(userModel.toJson()));
        await localStorage.saveAuthToken('mock_token_${userModel.id}');

        return Right(userModel.toEntity());
      } else {
        return const Left(NetworkFailure(
          message: 'Sem conexão com a internet',
        ));
      }
    } catch (e) {
      return Left(GenericFailure(
        message: 'Erro inesperado: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> validatePin({
    required String pin,
    required String userId,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await remoteDataSource.validatePin(
          pin: pin,
          userId: userId,
        );
        return Right(result);
      } else {
        return const Left(NetworkFailure(
          message: 'Sem conexão com a internet',
        ));
      }
    } catch (e) {
      return Left(GenericFailure(
        message: 'Erro inesperado: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> forgotPassword({
    required String email,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await remoteDataSource.forgotPassword(email: email);
        return Right(result);
      } else {
        return const Left(NetworkFailure(
          message: 'Sem conexão com a internet',
        ));
      }
    } catch (e) {
      return Left(GenericFailure(
        message: 'Erro inesperado: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await localStorage.removeAuthToken();
      await localStorage.removeUserData();
      return const Right(true);
    } catch (e) {
      return Left(CacheFailure(
        message: 'Erro ao fazer logout: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final token = await localStorage.getAuthToken();
      return Right(token != null && token.isNotEmpty);
    } catch (e) {
      return Left(CacheFailure(
        message: 'Erro ao verificar login: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final userDataString = await localStorage.getUserData();
      if (userDataString != null) {
        final userJson = jsonDecode(userDataString) as Map<String, dynamic>;
        final userModel = UserModel.fromJson(userJson);
        return Right(userModel.toEntity());
      }
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(
        message: 'Erro ao obter usuário atual: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> saveAuthToken(String token) async {
    try {
      final result = await localStorage.saveAuthToken(token);
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(
        message: 'Erro ao salvar token: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<Failure, String?>> getAuthToken() async {
    try {
      final token = await localStorage.getAuthToken();
      return Right(token);
    } catch (e) {
      return Left(CacheFailure(
        message: 'Erro ao obter token: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> removeAuthToken() async {
    try {
      final result = await localStorage.removeAuthToken();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(
        message: 'Erro ao remover token: ${e.toString()}',
      ));
    }
  }
}
