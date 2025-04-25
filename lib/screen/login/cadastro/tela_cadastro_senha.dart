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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              text: 'Email e Senha',
              style: AppTextStyleType.title,
            ),
            const SizedBox(height: 24),
            const AppText(
              text: 'Digite seu e-mail para se cadastrar e sua senha',
              style: AppTextStyleType.bodyLarge,
            ),
            const SizedBox(height: 24),
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
            const SizedBox(height: 10),
            CustomTextField(hintText: 'Confirmar senha', obscureText: obscureTextConfirm,
              suffixIcon: IconButton(
                icon: Icon(
                  obscureTextConfirm ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    obscureTextConfirm = !obscureTextConfirm;
                  });
                },
              ),
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