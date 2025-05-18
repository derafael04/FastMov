import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:fastmov/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Email e Senha',
              style: AppTextStyleType.title,
            ),
            SizedBox(height: 24),
            AppText(
              text: 'Digite seu e-mail para se cadastrar e sua senha',
              style: AppTextStyleType.bodyLarge,
            ),
            SizedBox(height: 24),
            CustomTextField(hintText: 'Email'),
            SizedBox(height: 10),
            CustomTextField(
              hintText: 'Senha',
              isPassword: true,
            ),
            SizedBox(height: 10),
            CustomTextField(
              hintText: 'Confirmar senha',
              isPassword: true,
            ),
          ],
        ),
        CustomButton(
          label: 'Próximo',
          type: ButtonType.primary,
          onPressed: () {
            widget.pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}