import 'package:fastmov/screen/login/cadastro/tela_cadastro_endereco.dart';
import 'package:fastmov/screen/login/cadastro/tela_cadastro_senha.dart';
import 'package:fastmov/screen/login/cadastro/tela_cadastro_telefone.dart';
import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:flutter/material.dart';

class TelaCadastroLogin extends StatefulWidget {
  const TelaCadastroLogin({super.key});

  @override
  State<TelaCadastroLogin> createState() => _TelaCadastroLoginState();
}

class _TelaCadastroLoginState extends State<TelaCadastroLogin> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CadastroAppBarComControle(
      title: 'Cadastro',
      controller: _pageController,
      totalSteps: 3,
      onBack: () {
        if (_pageController.page == 0) {
          Navigator.pop(context);
        } else {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      onInfoTap: () {
        Navigator.pushNamed(context, '/telaAjuda');
      },
    ),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TelaCadastroSenha(pageController: _pageController),
          TelaCadastroEndereco(pageController: _pageController,),
          TelaCadastroTelefone(pageController: _pageController)
        ],
      ),
    ),
    );
  }
}