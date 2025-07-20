import 'package:flutter/material.dart';

import '../../core/errors/failures.dart';
import '../../core/utils/either.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/local/local_storage.dart';

/// Implementação do repository de tema
class ThemeRepositoryImpl implements ThemeRepository {
  final LocalStorage localStorage;

  ThemeRepositoryImpl({required this.localStorage});

  @override
  Future<Either<Failure, ThemeMode>> getTheme() async {
    try {
      final theme = await localStorage.getTheme();
      return Right(theme);
    } catch (e) {
      return Left(CacheFailure(
        message: 'Erro ao obter tema: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> setTheme(ThemeMode theme) async {
    try {
      final result = await localStorage.saveTheme(theme);
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(
        message: 'Erro ao salvar tema: ${e.toString()}',
      ));
    }
  }
}
