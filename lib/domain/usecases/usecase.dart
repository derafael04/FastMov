import '../../core/errors/failures.dart';
import '../../core/utils/either.dart';

/// Classe abstrata base para todos os Use Cases
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use Case sem parâmetros
abstract class NoParamsUseCase<Type> {
  Future<Either<Failure, Type>> call();
}

/// Classe para representar ausência de parâmetros
class NoParams {
  const NoParams();
}
