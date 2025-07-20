import 'package:equatable/equatable.dart';

import '../../../core/errors/failures.dart';
import '../../../core/utils/either.dart';
import '../../../core/utils/validators.dart';
import '../../repositories/auth_repository.dart';
import '../usecase.dart';

/// Use Case para validação de PIN
class ValidatePinUseCase implements UseCase<bool, ValidatePinParams> {
  final AuthRepository repository;

  ValidatePinUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(ValidatePinParams params) async {
    // Validação dos parâmetros
    final pinValidation = Validators.validatePin(params.pin);
    if (pinValidation != null) {
      return Left(ValidationFailure(message: pinValidation));
    }

    if (params.userId.isEmpty) {
      return const Left(ValidationFailure(message: 'ID do usuário é obrigatório'));
    }

    // Chama o repository
    return await repository.validatePin(
      pin: params.pin,
      userId: params.userId,
    );
  }
}

/// Parâmetros para o ValidatePinUseCase
class ValidatePinParams extends Equatable {
  final String pin;
  final String userId;

  const ValidatePinParams({
    required this.pin,
    required this.userId,
  });

  @override
  List<Object> get props => [pin, userId];
}
