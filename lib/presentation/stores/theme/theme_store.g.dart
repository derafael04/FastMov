// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStore on _ThemeStoreBase, Store {
  Computed<bool>? _$isDarkModeComputed;

  @override
  bool get isDarkMode =>
      (_$isDarkModeComputed ??= Computed<bool>(() => super.isDarkMode,
              name: '_ThemeStoreBase.isDarkMode'))
          .value;
  Computed<bool>? _$isLightModeComputed;

  @override
  bool get isLightMode =>
      (_$isLightModeComputed ??= Computed<bool>(() => super.isLightMode,
              name: '_ThemeStoreBase.isLightMode'))
          .value;
  Computed<bool>? _$isSystemModeComputed;

  @override
  bool get isSystemMode =>
      (_$isSystemModeComputed ??= Computed<bool>(() => super.isSystemMode,
              name: '_ThemeStoreBase.isSystemMode'))
          .value;

  late final _$themeModeAtom =
      Atom(name: '_ThemeStoreBase.themeMode', context: context);

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ThemeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_ThemeStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$_loadThemeAsyncAction =
      AsyncAction('_ThemeStoreBase._loadTheme', context: context);

  @override
  Future<void> _loadTheme() {
    return _$_loadThemeAsyncAction.run(() => super._loadTheme());
  }

  late final _$setThemeAsyncAction =
      AsyncAction('_ThemeStoreBase.setTheme', context: context);

  @override
  Future<bool> setTheme(ThemeMode theme) {
    return _$setThemeAsyncAction.run(() => super.setTheme(theme));
  }

  late final _$toggleThemeAsyncAction =
      AsyncAction('_ThemeStoreBase.toggleTheme', context: context);

  @override
  Future<void> toggleTheme() {
    return _$toggleThemeAsyncAction.run(() => super.toggleTheme());
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
isDarkMode: ${isDarkMode},
isLightMode: ${isLightMode},
isSystemMode: ${isSystemMode}
    ''';
  }
}
