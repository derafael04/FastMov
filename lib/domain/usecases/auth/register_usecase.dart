import 'package:equatable/equatable.dart';

import '../../../core/errors/failures.dart';
import '../../../core/utils/either.dart';
import '../../../core/utils/validators.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repository.dart';
import '../usecase.dart';

/// Use Case para registro de usuário
class RegisterUseCase implements UseCase<User, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(RegisterParams params) async {
    // Validação dos parâmetros
    final nameValidation = Validators.validateName(params.name);
    if (nameValidation != null) {
      return Left(ValidationFailure(message: nameValidation));
    }

    final emailValidation = Validators.validateEmail(params.email);
    if (emailValidation != null) {
      return Left(ValidationFailure(message: emailValidation));
    }

    final passwordValidation = Validators.validatePassword(params.password);
    if (passwordValidation != null) {
      return Left(ValidationFailure(message: passwordValidation));
    }

    final phoneValidation = Validators.validatePhone(params.phone);
    if (phoneValidation != null) {
      return Left(ValidationFailure(message: phoneValidation));
    }

    // Chama o repository
    return await repository.register(
      name: params.name,
      email: params.email,
      password: params.password,
      phone: params.phone,
    );
  }
}

/// Parâmetros para o RegisterUseCase
class RegisterParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phone;

  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  List<Object> get props => [name, email, password, phone];
}
