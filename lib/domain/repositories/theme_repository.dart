import 'package:flutter/material.dart';
import '../../core/errors/failures.dart';
import '../../core/utils/either.dart';

/// Repository abstrato para gerenciamento de tema
abstract class ThemeRepository {
  /// Obtém o tema atual
  Future<Either<Failure, ThemeMode>> getTheme();

  /// Define o tema
  Future<Either<Failure, bool>> setTheme(ThemeMode theme);
}
