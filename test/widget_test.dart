import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


import 'package:fastmov/presentation/stores/auth/auth_store.dart';
import 'package:fastmov/presentation/stores/theme/theme_store.dart';
import 'package:fastmov/screen/login/tela_login_inicial.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:fastmov/widget/custom_text_field.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([AuthStore, ThemeStore])
void main() {
  late MockAuthStore mockAuthStore;
  late MockThemeStore mockThemeStore;

  setUp(() {
    mockAuthStore = MockAuthStore();
    mockThemeStore = MockThemeStore();

    // Setup default values for mocks
    when(mockAuthStore.email).thenReturn('');
    when(mockAuthStore.password).thenReturn('');
    when(mockAuthStore.emailError).thenReturn(null);
    when(mockAuthStore.passwordError).thenReturn(null);
    when(mockAuthStore.errorMessage).thenReturn(null);
    when(mockAuthStore.isLoading).thenReturn(false);
    when(mockAuthStore.canLogin).thenReturn(false);
    
    when(mockThemeStore.themeMode).thenReturn(ThemeMode.light);
  });

  group('CustomButton Widget Tests', () {
    testWidgets('should display label correctly', (WidgetTester tester) async {
      // arrange
      const buttonLabel = 'Test Button';

      // act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomButton(
              label: buttonLabel,
              type: ButtonType.primary,
              onPressed: null,
            ),
          ),
        ),
      );

      // assert
      expect(find.text(buttonLabel), findsOneWidget);
    });

    testWidgets('should call onPressed when tapped', (WidgetTester tester) async {
      // arrange
      bool wasPressed = false;
      void onPressed() {
        wasPressed = true;
      }

      // act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              label: 'Test Button',
              type: ButtonType.primary,
              onPressed: onPressed,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CustomButton));
      await tester.pump();

      // assert
      expect(wasPressed, isTrue);
    });

    testWidgets('should be disabled when onPressed is null', (WidgetTester tester) async {
      // act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              label: 'Disabled Button',
              type: ButtonType.disabledLight,
              onPressed: null,
            ),
          ),
        ),
      );

      // assert
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);
    });
  });

  group('CustomTextField Widget Tests', () {
    testWidgets('should display hint text', (WidgetTester tester) async {
      // arrange
      const hintText = 'Enter your email';

      // act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              hintText: hintText,
              onChanged: (value) {},
            ),
          ),
        ),
      );

      // assert
      expect(find.text(hintText), findsOneWidget);
    });

    testWidgets('should call onChanged when text is entered', (WidgetTester tester) async {
      // arrange
      String? changedValue;
      void onChanged(String value) {
        changedValue = value;
      }

      // act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              hintText: 'Test Field',
              onChanged: onChanged,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'test input');
      await tester.pump();

      // assert
      expect(changedValue, 'test input');
    });

    testWidgets('should display suffix icon when provided', (WidgetTester tester) async {
      // act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              hintText: 'Password',
              obscureText: true,
              suffixIcon: const Icon(Icons.visibility),
              onChanged: (value) {},
            ),
          ),
        ),
      );

      // assert
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });
  });

  group('Integration Tests', () {
    testWidgets('Login screen should display correctly', (WidgetTester tester) async {
      // arrange
      when(mockAuthStore.email).thenReturn('');
      when(mockAuthStore.password).thenReturn('');
      when(mockAuthStore.emailError).thenReturn(null);
      when(mockAuthStore.passwordError).thenReturn(null);
      when(mockAuthStore.errorMessage).thenReturn(null);
      when(mockAuthStore.isLoading).thenReturn(false);
      when(mockAuthStore.canLogin).thenReturn(false);

      // Mock the service locator
      // Note: In a real test, you'd need to properly mock the service locator
      // This is a simplified version for demonstration

      // act
      await tester.pumpWidget(
        const MaterialApp(
          home: TelaLoginInicial(),
        ),
      );

      // assert
      expect(find.text('Bem-vindo!'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Senha'), findsOneWidget);
      expect(find.text('Entrar'), findsOneWidget);
      expect(find.text('Esqueceu sua senha?'), findsOneWidget);
    });
  });
}
