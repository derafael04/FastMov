import 'package:fastmov/widget/custom_button.dart';
import 'package:fastmov/widget/custom_text_field.dart';
import 'package:fastmov/widget/social_button.dart';
import 'package:flutter/material.dart';

class TelaLoginInicial extends StatefulWidget {
  const TelaLoginInicial({super.key});

  @override
  State<TelaLoginInicial> createState() => _TelaLoginInicialState();
}

class _TelaLoginInicialState extends State<TelaLoginInicial> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      body: Padding(
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
          const CustomTextField(hintText: 'Email'),
          const SizedBox(height: 10),
          CustomTextField(hintText: 'Senha', obscureText: obscureText,
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/telaEsqueceuSenha');
              },
              child: const Text(
                'Esqueceu sua senha?',
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomButton(
            label: 'Entrar',
            type: ButtonType.primary,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
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
                Navigator.of(context).pushNamed('/telaCadastroLogin');
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
    );
  }
}