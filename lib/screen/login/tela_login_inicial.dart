import 'package:fastmov/widget/custom_text_field.dart';
import 'package:fastmov/widget/social_button.dart';
import 'package:flutter/material.dart';

class TelaLoginInicial extends StatefulWidget {
  const TelaLoginInicial({super.key});

  @override
  State<TelaLoginInicial> createState() => _TelaLoginInicialState();
}

class _TelaLoginInicialState extends State<TelaLoginInicial> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            const CustomTextField(hintText: 'Senha', obscureText: true),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {},
              child: const Text(
                'Entrar',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
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
                onTap: () {},
                child: const Text(
                  'Crie um conta Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
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