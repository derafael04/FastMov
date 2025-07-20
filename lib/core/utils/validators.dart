import '../constants/app_constants.dart';

/// Classe utilitária para validações
class Validators {
  /// Valida email
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email é obrigatório';
    }
    
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return 'Email inválido';
    }
    
    return null;
  }

  /// Valida senha
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Senha é obrigatória';
    }
    
    if (password.length < AppConstants.minPasswordLength) {
      return 'Senha deve ter pelo menos ${AppConstants.minPasswordLength} caracteres';
    }
    
    if (password.length > AppConstants.maxPasswordLength) {
      return 'Senha deve ter no máximo ${AppConstants.maxPasswordLength} caracteres';
    }
    
    return null;
  }

  /// Valida nome
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Nome é obrigatório';
    }
    
    if (name.trim().length < 2) {
      return 'Nome deve ter pelo menos 2 caracteres';
    }
    
    return null;
  }

  /// Valida telefone
  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Telefone é obrigatório';
    }
    
    // Remove caracteres não numéricos
    final cleanPhone = phone.replaceAll(RegExp(r'[^\d]'), '');
    
    if (cleanPhone.length < 10 || cleanPhone.length > 11) {
      return 'Telefone inválido';
    }
    
    return null;
  }

  /// Valida CEP
  static String? validateCep(String? cep) {
    if (cep == null || cep.isEmpty) {
      return 'CEP é obrigatório';
    }
    
    // Remove caracteres não numéricos
    final cleanCep = cep.replaceAll(RegExp(r'[^\d]'), '');
    
    if (cleanCep.length != 8) {
      return 'CEP deve ter 8 dígitos';
    }
    
    return null;
  }

  /// Valida PIN
  static String? validatePin(String? pin) {
    if (pin == null || pin.isEmpty) {
      return 'PIN é obrigatório';
    }
    
    if (pin.length != AppConstants.pinLength) {
      return 'PIN deve ter ${AppConstants.pinLength} dígitos';
    }
    
    if (!RegExp(r'^\d+$').hasMatch(pin)) {
      return 'PIN deve conter apenas números';
    }
    
    return null;
  }

  /// Valida campo obrigatório genérico
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName é obrigatório';
    }
    return null;
  }
}
