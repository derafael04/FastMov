import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:fastmov/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaCadastroSenha extends StatefulWidget {
  final PageController pageController;
  const TelaCadastroSenha({super.key, required this.pageController});

  @override
  State<TelaCadastroSenha> createState() => _TelaCadastroSenhaState();
}

class _TelaCadastroSenhaState extends State<TelaCadastroSenha> {
  bool obscureText = true;
  bool obscureTextConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
        child: CustomButton(
          label: 'Próximo',
          type: ButtonType.primary,
          onPressed: () {
            widget.pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextTitle1('Email e Senha'),
          const SizedBox(height: 24),
          const CustomTextBody('Digite seu e-mail para se cadastrar e sua senha'),
          const SizedBox(height: 24),
          const CustomTextField(hintText: 'Email'),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: 'Senha',
            obscureText: obscureText,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: HeroIcon(obscureText ? HeroIcons.eye : HeroIcons.eyeSlash, size: 20, color: Colors.black54)),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: 'Confirmar senha',
            obscureText: obscureTextConfirm,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  obscureTextConfirm = !obscureTextConfirm;
                });
              },
              child: HeroIcon(obscureTextConfirm ? HeroIcons.eye : HeroIcons.eyeSlash, size: 20, color: Colors.black54)),
          ),
        ],
      ),
    );
  }
}