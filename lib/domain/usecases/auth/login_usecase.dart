import 'package:equatable/equatable.dart';

import '../../../core/errors/failures.dart';
import '../../../core/utils/either.dart';
import '../../../core/utils/validators.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repository.dart';
import '../usecase.dart';

/// Use Case para login do usuário
class LoginUseCase implements UseCase<User, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    // Validação dos parâmetros
    final emailValidation = Validators.validateEmail(params.email);
    if (emailValidation != null) {
      return Left(ValidationFailure(message: emailValidation));
    }

    final passwordValidation = Validators.validatePassword(params.password);
    if (passwordValidation != null) {
      return Left(ValidationFailure(message: passwordValidation));
    }

    // Chama o repository
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

/// Parâmetros para o LoginUseCase
class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
