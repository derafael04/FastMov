import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fastmov/core/errors/failures.dart';
import 'package:fastmov/core/utils/either.dart';
import 'package:fastmov/domain/entities/user.dart';
import 'package:fastmov/domain/repositories/auth_repository.dart';
import 'package:fastmov/domain/usecases/auth/login_usecase.dart';

import 'login_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late LoginUseCase useCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = LoginUseCase(mockAuthRepository);
  });

  final testUser = User(
    id: '1',
    name: 'Test User',
    email: 'test@example.com',
    phone: '(11) 99999-9999',
    createdAt: DateTime.parse('2023-01-01T00:00:00.000Z'),
    updatedAt: DateTime.parse('2023-01-01T00:00:00.000Z'),
  );

  const testEmail = 'test@example.com';
  const testPassword = '123456';

  group('LoginUseCase', () {
    test('should return User when login is successful', () async {
      // arrange
      when(mockAuthRepository.login(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenAnswer((_) async => Right(testUser));

      // act
      final result = await useCase(const LoginParams(
        email: testEmail,
        password: testPassword,
      ));

      // assert
      expect(result, Right(testUser));
      verify(mockAuthRepository.login(
        email: testEmail,
        password: testPassword,
      ));
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return ValidationFailure when email is empty', () async {
      // act
      final result = await useCase(const LoginParams(
        email: '',
        password: testPassword,
      ));

      // assert
      expect(result, isA<Left<Failure, User>>());
      result.fold(
        (failure) => expect(failure, isA<ValidationFailure>()),
        (user) => fail('Should return failure'),
      );
      verifyZeroInteractions(mockAuthRepository);
    });

    test('should return ValidationFailure when email is invalid', () async {
      // act
      final result = await useCase(const LoginParams(
        email: 'invalid-email',
        password: testPassword,
      ));

      // assert
      expect(result, isA<Left<Failure, User>>());
      result.fold(
        (failure) => expect(failure, isA<ValidationFailure>()),
        (user) => fail('Should return failure'),
      );
      verifyZeroInteractions(mockAuthRepository);
    });

    test('should return ValidationFailure when password is empty', () async {
      // act
      final result = await useCase(const LoginParams(
        email: testEmail,
        password: '',
      ));

      // assert
      expect(result, isA<Left<Failure, User>>());
      result.fold(
        (failure) => expect(failure, isA<ValidationFailure>()),
        (user) => fail('Should return failure'),
      );
      verifyZeroInteractions(mockAuthRepository);
    });

    test('should return ValidationFailure when password is too short', () async {
      // act
      final result = await useCase(const LoginParams(
        email: testEmail,
        password: '123',
      ));

      // assert
      expect(result, isA<Left<Failure, User>>());
      result.fold(
        (failure) => expect(failure, isA<ValidationFailure>()),
        (user) => fail('Should return failure'),
      );
      verifyZeroInteractions(mockAuthRepository);
    });

    test('should return AuthFailure when repository returns failure', () async {
      // arrange
      const authFailure = AuthFailure(message: 'Invalid credentials');
      when(mockAuthRepository.login(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenAnswer((_) async => const Left(authFailure));

      // act
      final result = await useCase(const LoginParams(
        email: testEmail,
        password: testPassword,
      ));

      // assert
      expect(result, isA<Left<Failure, User>>());
      result.fold(
        (failure) => expect(failure, isA<AuthFailure>()),
        (user) => fail('Should return failure'),
      );
      verify(mockAuthRepository.login(
        email: testEmail,
        password: testPassword,
      ));
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
