import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fastmov/core/errors/failures.dart';
import 'package:fastmov/core/utils/either.dart';
import 'package:fastmov/domain/entities/user.dart';
import 'package:fastmov/domain/usecases/auth/login_usecase.dart';
import 'package:fastmov/domain/usecases/auth/register_usecase.dart';
import 'package:fastmov/domain/usecases/auth/validate_pin_usecase.dart';
import 'package:fastmov/presentation/stores/auth/auth_store.dart';

import 'auth_store_test.mocks.dart';

@GenerateMocks([LoginUseCase, RegisterUseCase, ValidatePinUseCase])
void main() {
  late AuthStore authStore;
  late MockLoginUseCase mockLoginUseCase;
  late MockRegisterUseCase mockRegisterUseCase;
  late MockValidatePinUseCase mockValidatePinUseCase;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockRegisterUseCase = MockRegisterUseCase();
    mockValidatePinUseCase = MockValidatePinUseCase();
    
    authStore = AuthStore(
      loginUseCase: mockLoginUseCase,
      registerUseCase: mockRegisterUseCase,
      validatePinUseCase: mockValidatePinUseCase,
    );
  });

  final testUser = User(
    id: '1',
    name: 'Test User',
    email: 'test@example.com',
    phone: '(11) 99999-9999',
    createdAt: DateTime.parse('2023-01-01T00:00:00.000Z'),
    updatedAt: DateTime.parse('2023-01-01T00:00:00.000Z'),
  );

  group('AuthStore', () {
    group('setEmail', () {
      test('should update email and clear errors', () {
        // arrange
        authStore.emailError = 'Some error';
        authStore.errorMessage = 'Some error';

        // act
        authStore.setEmail('test@example.com');

        // assert
        expect(authStore.email, 'test@example.com');
        expect(authStore.emailError, isNull);
        expect(authStore.errorMessage, isNull);
      });
    });

    group('setPassword', () {
      test('should update password and clear errors', () {
        // arrange
        authStore.passwordError = 'Some error';
        authStore.errorMessage = 'Some error';

        // act
        authStore.setPassword('123456');

        // assert
        expect(authStore.password, '123456');
        expect(authStore.passwordError, isNull);
        expect(authStore.errorMessage, isNull);
      });
    });

    group('canLogin', () {
      test('should return true when email and password are not empty and not loading', () {
        // arrange
        authStore.setEmail('test@example.com');
        authStore.setPassword('123456');
        authStore.isLoading = false;

        // assert
        expect(authStore.canLogin, isTrue);
      });

      test('should return false when email is empty', () {
        // arrange
        authStore.setEmail('');
        authStore.setPassword('123456');
        authStore.isLoading = false;

        // assert
        expect(authStore.canLogin, isFalse);
      });

      test('should return false when password is empty', () {
        // arrange
        authStore.setEmail('test@example.com');
        authStore.setPassword('');
        authStore.isLoading = false;

        // assert
        expect(authStore.canLogin, isFalse);
      });

      test('should return false when loading', () {
        // arrange
        authStore.setEmail('test@example.com');
        authStore.setPassword('123456');
        authStore.isLoading = true;

        // assert
        expect(authStore.canLogin, isFalse);
      });
    });

    group('login', () {
      test('should return true and update user when login is successful', () async {
        // arrange
        authStore.setEmail('test@example.com');
        authStore.setPassword('123456');
        
        when(mockLoginUseCase(any))
            .thenAnswer((_) async => Right(testUser));

        // act
        final result = await authStore.login();

        // assert
        expect(result, isTrue);
        expect(authStore.currentUser, testUser);
        expect(authStore.isLoggedIn, isTrue);
        expect(authStore.isLoading, isFalse);
        expect(authStore.email, isEmpty);
        expect(authStore.password, isEmpty);
        
        verify(mockLoginUseCase(const LoginParams(
          email: 'test@example.com',
          password: '123456',
        )));
      });

      test('should return false and set error when login fails', () async {
        // arrange
        authStore.setEmail('test@example.com');
        authStore.setPassword('123456');
        
        const failure = AuthFailure(message: 'Invalid credentials');
        when(mockLoginUseCase(any))
            .thenAnswer((_) async => const Left(failure));

        // act
        final result = await authStore.login();

        // assert
        expect(result, isFalse);
        expect(authStore.currentUser, isNull);
        expect(authStore.isLoggedIn, isFalse);
        expect(authStore.isLoading, isFalse);
        expect(authStore.errorMessage, 'Invalid credentials');
        
        verify(mockLoginUseCase(const LoginParams(
          email: 'test@example.com',
          password: '123456',
        )));
      });

      test('should handle validation failure correctly', () async {
        // arrange
        authStore.setEmail('test@example.com');
        authStore.setPassword('123456');
        
        const failure = ValidationFailure(message: 'Email inválido');
        when(mockLoginUseCase(any))
            .thenAnswer((_) async => const Left(failure));

        // act
        final result = await authStore.login();

        // assert
        expect(result, isFalse);
        expect(authStore.emailError, 'Email inválido');
        expect(authStore.isLoading, isFalse);
      });
    });

    group('logout', () {
      test('should clear all user data and state', () {
        // arrange
        authStore.currentUser = testUser;
        authStore.isLoggedIn = true;
        authStore.setEmail('test@example.com');
        authStore.setPassword('123456');
        authStore.setPin('1234');
        authStore.isPinValid = true;

        // act
        authStore.logout();

        // assert
        expect(authStore.currentUser, isNull);
        expect(authStore.isLoggedIn, isFalse);
        expect(authStore.email, isEmpty);
        expect(authStore.password, isEmpty);
        expect(authStore.pin, isEmpty);
        expect(authStore.isPinValid, isFalse);
      });
    });

    group('validatePin', () {
      test('should return true when PIN is valid', () async {
        // arrange
        authStore.setPin('1234');
        
        when(mockValidatePinUseCase(any))
            .thenAnswer((_) async => const Right(true));

        // act
        final result = await authStore.validatePin('user123');

        // assert
        expect(result, isTrue);
        expect(authStore.isPinValid, isTrue);
        expect(authStore.isLoggedIn, isTrue);
        expect(authStore.isLoading, isFalse);
        
        verify(mockValidatePinUseCase(const ValidatePinParams(
          pin: '1234',
          userId: 'user123',
        )));
      });

      test('should return false when PIN is invalid', () async {
        // arrange
        authStore.setPin('1234');
        
        when(mockValidatePinUseCase(any))
            .thenAnswer((_) async => const Right(false));

        // act
        final result = await authStore.validatePin('user123');

        // assert
        expect(result, isFalse);
        expect(authStore.isPinValid, isFalse);
        expect(authStore.isLoggedIn, isFalse);
        expect(authStore.isLoading, isFalse);
      });
    });
  });
}
