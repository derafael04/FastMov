import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:fastmov/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaAlterarSenha extends StatefulWidget {
  const TelaAlterarSenha({super.key});

  @override
  State<TelaAlterarSenha> createState() => _TelaAlterarSenhaState();
}

class _TelaAlterarSenhaState extends State<TelaAlterarSenha> {

  final TextEditingController controllerSenhaAtual = TextEditingController();
  final TextEditingController controllerNovaSenha = TextEditingController();
  final TextEditingController controllerConfirmarSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Alterar senha',
        actions: IconButton(
          onPressed: () {}, 
          icon: const HeroIcon(HeroIcons.informationCircle, size: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              hintText: 'Senha atual',
              controller: controllerSenhaAtual,
              onChanged: (p0) {},
            ),
            CustomTextField(
              hintText: 'Nova senha',
              controller: controllerNovaSenha,
              onChanged: (p0) {},
            ),
            CustomTextField(
              hintText: 'Confirmar nova senha',
              controller: controllerConfirmarSenha,
              onChanged: (p0) {},
            ),
            const SizedBox(height: 16),
            CustomButton(
              label: 'Salvar',
              type: ButtonType.primary,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}