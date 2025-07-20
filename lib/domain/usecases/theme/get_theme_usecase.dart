import 'package:flutter/material.dart';

import '../../../core/errors/failures.dart';
import '../../../core/utils/either.dart';
import '../../repositories/theme_repository.dart';
import '../usecase.dart';

/// Use Case para obter o tema atual
class GetThemeUseCase implements NoParamsUseCase<ThemeMode> {
  final ThemeRepository repository;

  GetThemeUseCase(this.repository);

  @override
  Future<Either<Failure, ThemeMode>> call() async {
    return await repository.getTheme();
  }
}
