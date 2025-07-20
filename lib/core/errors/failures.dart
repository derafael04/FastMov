/// Classe abstrata para representar falhas na aplicação
abstract class Failure {
  final String message;
  final int? code;

  const Failure({
    required this.message,
    this.code,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Failure && 
           other.message == message && 
           other.code == code;
  }

  @override
  int get hashCode => message.hashCode ^ code.hashCode;

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}

/// Falha de servidor
class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.code,
  });
}

/// Falha de cache/armazenamento local
class CacheFailure extends Failure {
  const CacheFailure({
    required super.message,
    super.code,
  });
}

/// Falha de validação
class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    super.code,
  });
}

/// Falha de rede
class NetworkFailure extends Failure {
  const NetworkFailure({
    required super.message,
    super.code,
  });
}

/// Falha de autenticação
class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
    super.code,
  });
}

/// Falha genérica
class GenericFailure extends Failure {
  const GenericFailure({
    required super.message,
    super.code,
  });
}
