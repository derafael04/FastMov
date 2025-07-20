// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin => (_$canLoginComputed ??=
          Computed<bool>(() => super.canLogin, name: '_AuthStoreBase.canLogin'))
      .value;
  Computed<bool>? _$canRegisterComputed;

  @override
  bool get canRegister =>
      (_$canRegisterComputed ??= Computed<bool>(() => super.canRegister,
              name: '_AuthStoreBase.canRegister'))
          .value;
  Computed<bool>? _$canValidatePinComputed;

  @override
  bool get canValidatePin =>
      (_$canValidatePinComputed ??= Computed<bool>(() => super.canValidatePin,
              name: '_AuthStoreBase.canValidatePin'))
          .value;
  Computed<bool>? _$hasLoginErrorsComputed;

  @override
  bool get hasLoginErrors =>
      (_$hasLoginErrorsComputed ??= Computed<bool>(() => super.hasLoginErrors,
              name: '_AuthStoreBase.hasLoginErrors'))
          .value;
  Computed<bool>? _$hasRegisterErrorsComputed;

  @override
  bool get hasRegisterErrors => (_$hasRegisterErrorsComputed ??= Computed<bool>(
          () => super.hasRegisterErrors,
          name: '_AuthStoreBase.hasRegisterErrors'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_AuthStoreBase.isLoading', context: context);

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
      Atom(name: '_AuthStoreBase.errorMessage', context: context);

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

  late final _$currentUserAtom =
      Atom(name: '_AuthStoreBase.currentUser', context: context);

  @override
  User? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$isLoggedInAtom =
      Atom(name: '_AuthStoreBase.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$emailAtom = Atom(name: '_AuthStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_AuthStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$emailErrorAtom =
      Atom(name: '_AuthStoreBase.emailError', context: context);

  @override
  String? get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(String? value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: '_AuthStoreBase.passwordError', context: context);

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$registerNameAtom =
      Atom(name: '_AuthStoreBase.registerName', context: context);

  @override
  String get registerName {
    _$registerNameAtom.reportRead();
    return super.registerName;
  }

  @override
  set registerName(String value) {
    _$registerNameAtom.reportWrite(value, super.registerName, () {
      super.registerName = value;
    });
  }

  late final _$registerEmailAtom =
      Atom(name: '_AuthStoreBase.registerEmail', context: context);

  @override
  String get registerEmail {
    _$registerEmailAtom.reportRead();
    return super.registerEmail;
  }

  @override
  set registerEmail(String value) {
    _$registerEmailAtom.reportWrite(value, super.registerEmail, () {
      super.registerEmail = value;
    });
  }

  late final _$registerPasswordAtom =
      Atom(name: '_AuthStoreBase.registerPassword', context: context);

  @override
  String get registerPassword {
    _$registerPasswordAtom.reportRead();
    return super.registerPassword;
  }

  @override
  set registerPassword(String value) {
    _$registerPasswordAtom.reportWrite(value, super.registerPassword, () {
      super.registerPassword = value;
    });
  }

  late final _$registerPhoneAtom =
      Atom(name: '_AuthStoreBase.registerPhone', context: context);

  @override
  String get registerPhone {
    _$registerPhoneAtom.reportRead();
    return super.registerPhone;
  }

  @override
  set registerPhone(String value) {
    _$registerPhoneAtom.reportWrite(value, super.registerPhone, () {
      super.registerPhone = value;
    });
  }

  late final _$registerNameErrorAtom =
      Atom(name: '_AuthStoreBase.registerNameError', context: context);

  @override
  String? get registerNameError {
    _$registerNameErrorAtom.reportRead();
    return super.registerNameError;
  }

  @override
  set registerNameError(String? value) {
    _$registerNameErrorAtom.reportWrite(value, super.registerNameError, () {
      super.registerNameError = value;
    });
  }

  late final _$registerEmailErrorAtom =
      Atom(name: '_AuthStoreBase.registerEmailError', context: context);

  @override
  String? get registerEmailError {
    _$registerEmailErrorAtom.reportRead();
    return super.registerEmailError;
  }

  @override
  set registerEmailError(String? value) {
    _$registerEmailErrorAtom.reportWrite(value, super.registerEmailError, () {
      super.registerEmailError = value;
    });
  }

  late final _$registerPasswordErrorAtom =
      Atom(name: '_AuthStoreBase.registerPasswordError', context: context);

  @override
  String? get registerPasswordError {
    _$registerPasswordErrorAtom.reportRead();
    return super.registerPasswordError;
  }

  @override
  set registerPasswordError(String? value) {
    _$registerPasswordErrorAtom.reportWrite(value, super.registerPasswordError,
        () {
      super.registerPasswordError = value;
    });
  }

  late final _$registerPhoneErrorAtom =
      Atom(name: '_AuthStoreBase.registerPhoneError', context: context);

  @override
  String? get registerPhoneError {
    _$registerPhoneErrorAtom.reportRead();
    return super.registerPhoneError;
  }

  @override
  set registerPhoneError(String? value) {
    _$registerPhoneErrorAtom.reportWrite(value, super.registerPhoneError, () {
      super.registerPhoneError = value;
    });
  }

  late final _$pinAtom = Atom(name: '_AuthStoreBase.pin', context: context);

  @override
  String get pin {
    _$pinAtom.reportRead();
    return super.pin;
  }

  @override
  set pin(String value) {
    _$pinAtom.reportWrite(value, super.pin, () {
      super.pin = value;
    });
  }

  late final _$pinErrorAtom =
      Atom(name: '_AuthStoreBase.pinError', context: context);

  @override
  String? get pinError {
    _$pinErrorAtom.reportRead();
    return super.pinError;
  }

  @override
  set pinError(String? value) {
    _$pinErrorAtom.reportWrite(value, super.pinError, () {
      super.pinError = value;
    });
  }

  late final _$isPinValidAtom =
      Atom(name: '_AuthStoreBase.isPinValid', context: context);

  @override
  bool get isPinValid {
    _$isPinValidAtom.reportRead();
    return super.isPinValid;
  }

  @override
  set isPinValid(bool value) {
    _$isPinValidAtom.reportWrite(value, super.isPinValid, () {
      super.isPinValid = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthStoreBase.login', context: context);

  @override
  Future<bool> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$registerAsyncAction =
      AsyncAction('_AuthStoreBase.register', context: context);

  @override
  Future<bool> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$validatePinAsyncAction =
      AsyncAction('_AuthStoreBase.validatePin', context: context);

  @override
  Future<bool> validatePin(String userId) {
    return _$validatePinAsyncAction.run(() => super.validatePin(userId));
  }

  late final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegisterName(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setRegisterName');
    try {
      return super.setRegisterName(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegisterEmail(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setRegisterEmail');
    try {
      return super.setRegisterEmail(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegisterPassword(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setRegisterPassword');
    try {
      return super.setRegisterPassword(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegisterPhone(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setRegisterPhone');
    try {
      return super.setRegisterPhone(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPin(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setPin');
    try {
      return super.setPin(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearErrors() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.clearErrors');
    try {
      return super.clearErrors();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearForm() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.clearForm');
    try {
      return super.clearForm();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearRegisterForm() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.clearRegisterForm');
    try {
      return super.clearRegisterForm();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.logout');
    try {
      return super.logout();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
currentUser: ${currentUser},
isLoggedIn: ${isLoggedIn},
email: ${email},
password: ${password},
emailError: ${emailError},
passwordError: ${passwordError},
registerName: ${registerName},
registerEmail: ${registerEmail},
registerPassword: ${registerPassword},
registerPhone: ${registerPhone},
registerNameError: ${registerNameError},
registerEmailError: ${registerEmailError},
registerPasswordError: ${registerPasswordError},
registerPhoneError: ${registerPhoneError},
pin: ${pin},
pinError: ${pinError},
isPinValid: ${isPinValid},
canLogin: ${canLogin},
canRegister: ${canRegister},
canValidatePin: ${canValidatePin},
hasLoginErrors: ${hasLoginErrors},
hasRegisterErrors: ${hasRegisterErrors}
    ''';
  }
}
