import 'package:mobx/mobx.dart';

import '../../../core/errors/failures.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/auth/login_usecase.dart';
import '../../../domain/usecases/auth/register_usecase.dart';
import '../../../domain/usecases/auth/validate_pin_usecase.dart';

part 'auth_store.g.dart';

/// Store para gerenciar estado de autenticação
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ValidatePinUseCase validatePinUseCase;

  _AuthStoreBase({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.validatePinUseCase,
  });

  // Observables
  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  User? currentUser;

  @observable
  bool isLoggedIn = false;

  // Login form
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String? emailError;

  @observable
  String? passwordError;

  // Register form
  @observable
  String registerName = '';

  @observable
  String registerEmail = '';

  @observable
  String registerPassword = '';

  @observable
  String registerPhone = '';

  @observable
  String? registerNameError;

  @observable
  String? registerEmailError;

  @observable
  String? registerPasswordError;

  @observable
  String? registerPhoneError;

  // PIN validation
  @observable
  String pin = '';

  @observable
  String? pinError;

  @observable
  bool isPinValid = false;

  // Actions
  @action
  void setEmail(String value) {
    email = value;
    emailError = null;
    errorMessage = null;
  }

  @action
  void setPassword(String value) {
    password = value;
    passwordError = null;
    errorMessage = null;
  }

  @action
  void setRegisterName(String value) {
    registerName = value;
    registerNameError = null;
    errorMessage = null;
  }

  @action
  void setRegisterEmail(String value) {
    registerEmail = value;
    registerEmailError = null;
    errorMessage = null;
  }

  @action
  void setRegisterPassword(String value) {
    registerPassword = value;
    registerPasswordError = null;
    errorMessage = null;
  }

  @action
  void setRegisterPhone(String value) {
    registerPhone = value;
    registerPhoneError = null;
    errorMessage = null;
  }

  @action
  void setPin(String value) {
    pin = value;
    pinError = null;
    errorMessage = null;
  }

  @action
  void clearErrors() {
    errorMessage = null;
    emailError = null;
    passwordError = null;
    registerNameError = null;
    registerEmailError = null;
    registerPasswordError = null;
    registerPhoneError = null;
    pinError = null;
  }

  @action
  void clearForm() {
    email = '';
    password = '';
    clearErrors();
  }

  @action
  void clearRegisterForm() {
    registerName = '';
    registerEmail = '';
    registerPassword = '';
    registerPhone = '';
    clearErrors();
  }

  @action
  Future<bool> login() async {
    isLoading = true;
    clearErrors();

    try {
      final result = await loginUseCase(LoginParams(
        email: email,
        password: password,
      ));

      return result.fold(
        (failure) {
          _handleFailure(failure);
          return false;
        },
        (user) {
          currentUser = user;
          isLoggedIn = true;
          clearForm();
          return true;
        },
      );
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> register() async {
    isLoading = true;
    clearErrors();

    try {
      final result = await registerUseCase(RegisterParams(
        name: registerName,
        email: registerEmail,
        password: registerPassword,
        phone: registerPhone,
      ));

      return result.fold(
        (failure) {
          _handleFailure(failure);
          return false;
        },
        (user) {
          currentUser = user;
          clearRegisterForm();
          return true;
        },
      );
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> validatePin(String userId) async {
    isLoading = true;
    clearErrors();

    try {
      final result = await validatePinUseCase(ValidatePinParams(
        pin: pin,
        userId: userId,
      ));

      return result.fold(
        (failure) {
          _handleFailure(failure);
          return false;
        },
        (isValid) {
          isPinValid = isValid;
          if (isValid) {
            isLoggedIn = true;
          }
          return isValid;
        },
      );
    } finally {
      isLoading = false;
    }
  }

  @action
  void logout() {
    currentUser = null;
    isLoggedIn = false;
    clearForm();
    clearRegisterForm();
    pin = '';
    isPinValid = false;
  }

  // Private methods
  void _handleFailure(Failure failure) {
    if (failure is ValidationFailure) {
      _handleValidationFailure(failure);
    } else {
      errorMessage = failure.message;
    }
  }

  void _handleValidationFailure(ValidationFailure failure) {
    final message = failure.message;
    
    if (message.toLowerCase().contains('email')) {
      emailError = message;
      registerEmailError = message;
    } else if (message.toLowerCase().contains('senha')) {
      passwordError = message;
      registerPasswordError = message;
    } else if (message.toLowerCase().contains('nome')) {
      registerNameError = message;
    } else if (message.toLowerCase().contains('telefone')) {
      registerPhoneError = message;
    } else if (message.toLowerCase().contains('pin')) {
      pinError = message;
    } else {
      errorMessage = message;
    }
  }

  // Computed
  @computed
  bool get canLogin => email.isNotEmpty && password.isNotEmpty && !isLoading;

  @computed
  bool get canRegister => 
      registerName.isNotEmpty && 
      registerEmail.isNotEmpty && 
      registerPassword.isNotEmpty && 
      registerPhone.isNotEmpty && 
      !isLoading;

  @computed
  bool get canValidatePin => pin.length == 4 && !isLoading;

  @computed
  bool get hasLoginErrors => emailError != null || passwordError != null;

  @computed
  bool get hasRegisterErrors => 
      registerNameError != null || 
      registerEmailError != null || 
      registerPasswordError != null || 
      registerPhoneError != null;
}
