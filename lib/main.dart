import 'package:fastmov/screen/assinatura/tela_assinatura.dart';
import 'package:fastmov/screen/assinatura/tela_finalizar_assinatura.dart';
import 'package:fastmov/screen/chat/tela_chat.dart';
import 'package:fastmov/screen/historico/tela_detalhes_profissional.dart';
import 'package:fastmov/screen/historico/tela_detalhes_sessao.dart';
import 'package:fastmov/screen/historico/tela_relatorio_sessao.dart';
import 'package:fastmov/screen/home/screen_home.dart';
import 'package:fastmov/screen/home/screen_introduction.dart';
import 'package:fastmov/screen/home/tela_inicial.dart';
import 'package:fastmov/screen/information/tela_ajuda.dart';
import 'package:fastmov/screen/login/cadastro/tela_cadastro_login.dart';
import 'package:fastmov/screen/login/cadastro/tela_validar_cadastro.dart';
import 'package:fastmov/screen/login/tela_esqueceu_senha.dart';
import 'package:fastmov/screen/login/tela_login_inicial.dart';
import 'package:fastmov/screen/perfil/pagamentos/tela_formas_pagamentos.dart';
import 'package:fastmov/screen/perfil/pagamentos/tela_historico_pagamentos.dart';
import 'package:fastmov/screen/perfil/tela_alterar_senha.dart';
import 'package:fastmov/screen/perfil/endereco/tela_edereco.dart';
import 'package:fastmov/screen/perfil/pagamentos/tela_pagamentos.dart';
import 'package:fastmov/screen/perfil/tela_perfil.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastMov',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF1F1F1),
        cardColor: Colors.white,
        canvasColor: const Color(0xffF3F3F4),
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
        shadowColor: const Color(0xff90949A),
        dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        dividerColor: const Color(0xffCFCFCF),
        dividerTheme: const DividerThemeData(color: Color(0xffDCDDDF), thickness: 1),
        //dialogBackgroundColor: Colors.grey[200],
        splashColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color(0xff51555A),
        ),
        useMaterial3: true,
        primaryColor: const Color(0xff161934),
      ),
      initialRoute: '/telaLoginInicial',
      routes: {
        //'/splash': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        '/telaInicial': (context) => const TelaInicial(),
        '/screenIntroduction': (context) => const ScreenIntroduction(),
        '/telaLoginInicial': (context) => const TelaLoginInicial(),
        '/telaEsqueceuSenha': (context) => const TelaEsqueceuSenha(),
        '/telaCadastroLogin': (context) => const TelaCadastroLogin(),
        '/telaAjuda': (context) => const TelaAjuda(),
        '/telaValidarCadastro': (context) => const TelaValidarCadastro(),
        '/telaDetalhesSessao': (context) => const TelaDetalhesSessao(),
        '/telaDetalhesProfissional': (context) => const TelaDetalhesProfissional(),
        '/telaRelatorioSessao': (context) => const TelaRelatorioSessao(),
        '/chatScreen': (context) => const ChatScreen(),
        '/telaPerfil': (context) => const TelaPerfil(),
        '/telaAlterarSenha': (context) => const TelaAlterarSenha(),
        '/telaEdereco': (context) => const TelaEdereco(),
        '/telaPagamentos': (context) => const TelaPagamentos(),
        '/telaHistoricoPagamentos': (context) => const TelaHistoricoPagamentos(),
        '/telaFormasPagamentos': (context) => const TelaFormasPagamentos(),
        '/telaAssinatura': (context) => const TelaAssinatura(),
        '/telaFinalizarAssinatura': (context) => const TelaFinalizarAssinatura(),
      },
    );
  }
}