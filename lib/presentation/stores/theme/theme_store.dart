import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/usecases/theme/get_theme_usecase.dart';
import '../../../domain/usecases/theme/set_theme_usecase.dart';

part 'theme_store.g.dart';

/// Store para gerenciar estado do tema
class ThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  final GetThemeUseCase getThemeUseCase;
  final SetThemeUseCase setThemeUseCase;

  _ThemeStoreBase({
    required this.getThemeUseCase,
    required this.setThemeUseCase,
  }) {
    _loadTheme();
  }

  // Observables
  @observable
  ThemeMode themeMode = ThemeMode.system;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  // Actions
  @action
  Future<void> _loadTheme() async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await getThemeUseCase();
      result.fold(
        (failure) {
          errorMessage = failure.message;
        },
        (theme) {
          themeMode = theme;
        },
      );
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> setTheme(ThemeMode theme) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await setThemeUseCase(SetThemeParams(theme: theme));
      
      return result.fold(
        (failure) {
          errorMessage = failure.message;
          return false;
        },
        (success) {
          if (success) {
            themeMode = theme;
          }
          return success;
        },
      );
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> toggleTheme() async {
    final newTheme = themeMode == ThemeMode.light 
        ? ThemeMode.dark 
        : ThemeMode.light;
    await setTheme(newTheme);
  }

  // Computed
  @computed
  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      // Em um app real, você obteria o brilho do sistema
      // Por enquanto, assumimos que é light
      return false;
    }
    return themeMode == ThemeMode.dark;
  }

  @computed
  bool get isLightMode => !isDarkMode;

  @computed
  bool get isSystemMode => themeMode == ThemeMode.system;
}
