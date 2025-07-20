import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../../core/errors/failures.dart';
import '../../../core/utils/either.dart';
import '../../repositories/theme_repository.dart';
import '../usecase.dart';

/// Use Case para definir o tema
class SetThemeUseCase implements UseCase<bool, SetThemeParams> {
  final ThemeRepository repository;

  SetThemeUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(SetThemeParams params) async {
    return await repository.setTheme(params.theme);
  }
}

/// Parâmetros para o SetThemeUseCase
class SetThemeParams extends Equatable {
  final ThemeMode theme;

  const SetThemeParams({required this.theme});

  @override
  List<Object> get props => [theme];
}
