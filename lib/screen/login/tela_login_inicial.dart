import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:heroicons/heroicons.dart';

import '../../core/constants/routes.dart';
import '../../core/di/injection_container.dart';
import '../../presentation/stores/auth/auth_store.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/social_button.dart';

class TelaLoginInicial extends StatefulWidget {
  const TelaLoginInicial({super.key});

  @override
  State<TelaLoginInicial> createState() => _TelaLoginInicialState();
}

class _TelaLoginInicialState extends State<TelaLoginInicial> {
  late final AuthStore authStore;
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    authStore = sl<AuthStore>();
  }

  Future<void> _handleLogin() async {
    final success = await authStore.login();
    if (success && mounted) {
      Navigator.pushReplacementNamed(context, Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      body: Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Bem-vindo!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    hintText: 'Email',
                    valorNoCampo: authStore.email,
                    onChanged: authStore.setEmail,
                    inputType: TextInputType.emailAddress,
                  ),
                  if (authStore.emailError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 4),
                      child: Text(
                        authStore.emailError!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    hintText: 'Senha',
                    valorNoCampo: authStore.password,
                    obscureText: obscureText,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: HeroIcon(
                        obscureText ? HeroIcons.eye : HeroIcons.eyeSlash,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                    onChanged: authStore.setPassword,
                  ),
                  if (authStore.passwordError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 4),
                      child: Text(
                        authStore.passwordError!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.forgotPassword);
                  },
                  child: const Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (authStore.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    authStore.errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              CustomButton(
                label: authStore.isLoading ? 'Entrando...' : 'Entrar',
                type: authStore.canLogin ? ButtonType.primary : ButtonType.disabledLight,
                onPressed: authStore.canLogin ? _handleLogin : null,
              ),
              const SizedBox(height: 20),
              const Center(child: Text('- Ou Continue com -')),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(icon: 'assets/images/icon/google_icon.png'),
                  SizedBox(width: 20),
                  SocialButton(icon: 'assets/images/icon/apple_icon.png'),
                  SizedBox(width: 20),
                  SocialButton(icon: 'assets/images/icon/facebook_icon.png'),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.register);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Crie um conta',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}