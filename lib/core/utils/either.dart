/// Classe para representar um resultado que pode ser sucesso ou falha
/// Similar ao Either do functional programming
abstract class Either<L, R> {
  const Either();

  /// Retorna true se é um Left (falha)
  bool get isLeft => this is Left<L, R>;

  /// Retorna true se é um Right (sucesso)
  bool get isRight => this is Right<L, R>;

  /// Executa uma função se for Left
  Either<L, R> onLeft(void Function(L left) fn) {
    if (isLeft) {
      fn((this as Left<L, R>).value);
    }
    return this;
  }

  /// Executa uma função se for Right
  Either<L, R> onRight(void Function(R right) fn) {
    if (isRight) {
      fn((this as Right<L, R>).value);
    }
    return this;
  }

  /// Mapeia o valor se for Right
  Either<L, T> map<T>(T Function(R right) fn) {
    if (isRight) {
      return Right(fn((this as Right<L, R>).value));
    }
    return Left((this as Left<L, R>).value);
  }

  /// Mapeia o valor se for Left
  Either<T, R> mapLeft<T>(T Function(L left) fn) {
    if (isLeft) {
      return Left(fn((this as Left<L, R>).value));
    }
    return Right((this as Right<L, R>).value);
  }

  /// Fold - executa uma função dependendo do tipo
  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight) {
    if (isLeft) {
      return onLeft((this as Left<L, R>).value);
    }
    return onRight((this as Right<L, R>).value);
  }
}

/// Representa um valor de falha (Left)
class Left<L, R> extends Either<L, R> {
  final L value;
  const Left(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Left<L, R> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Left($value)';
}

/// Representa um valor de sucesso (Right)
class Right<L, R> extends Either<L, R> {
  final R value;
  const Right(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Right<L, R> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Right($value)';
}
