import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:fastmov/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class TelaCadastroTelefone extends StatefulWidget {
  final PageController pageController;
  const TelaCadastroTelefone({super.key, required this.pageController});

  @override
  State<TelaCadastroTelefone> createState() => _TelaCadastroTelefoneState();
}

class _TelaCadastroTelefoneState extends State<TelaCadastroTelefone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
        child: CustomButton(
          label: 'Próximo',
          type: ButtonType.primary,
          onPressed: () {
            Navigator.of(context).pushNamed('/telaValidarCadastro');
          },
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextTitle1('Telefone'),
          SizedBox(height: 24),
          CustomTextBody('Crie uma conta e aproveite os benefícios que oferecemos para você'),
          SizedBox(height: 24),
          CustomTextField(hintText: 'Número de telefone'),
        ],
      ),
    );
  }
}