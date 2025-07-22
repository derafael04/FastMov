import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/constants/routes.dart';
import 'core/di/injection_container.dart' as di;
import 'presentation/stores/theme/theme_store.dart';
import 'screen/ajuda/tela_ajuda.dart';
import 'screen/assinatura/tela_assinatura.dart';
import 'screen/assinatura/tela_finalizar_assinatura.dart';
import 'screen/chat/tela_chat.dart';
import 'screen/compra/tela_compra.dart';
import 'screen/compra/tela_finalizar_compra.dart';
import 'screen/favoritos/tela_favoritos.dart';
import 'screen/gameficacao/tela_gameficacao.dart';
import 'screen/historico/tela_detalhes_profissional.dart';
import 'screen/historico/tela_detalhes_sessao.dart';
import 'screen/historico/tela_historico_sessao.dart';
import 'screen/historico/tela_relatorio_sessao.dart';
import 'screen/home/screen_home.dart';
import 'screen/home/screen_introduction.dart';
import 'screen/home/tela_indique.dart';
import 'screen/home/tela_inicial.dart';
import 'screen/login/cadastro/tela_cadastro_login.dart';
import 'screen/login/cadastro/tela_validar_cadastro.dart';
import 'screen/login/tela_esqueceu_senha.dart';
import 'screen/login/tela_login_inicial.dart';
import 'screen/perfil/endereco/tela_edereco.dart';
import 'screen/perfil/pagamentos/tela_formas_pagamentos.dart';
import 'screen/perfil/pagamentos/tela_historico_pagamentos.dart';
import 'screen/perfil/pagamentos/tela_pagamentos.dart';
import 'screen/perfil/tela_alterar_senha.dart';
import 'screen/perfil/tela_perfil.dart';
import 'screen/sobre/tela_sobre_fastmov.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeStore = di.sl<ThemeStore>();
    return Observer(
      builder: (_) => MaterialApp(
        title: 'FastMov',
        debugShowCheckedModeBanner: false,
        theme: _buildLightTheme(),
        darkTheme: _buildDarkTheme(),
        themeMode: themeStore.themeMode,
        initialRoute: Routes.login,
        routes: {
          // Rotas de autenticação
          Routes.login: (context) => const TelaLoginInicial(),
          Routes.register: (context) => const TelaCadastroLogin(),
          Routes.forgotPassword: (context) => const TelaEsqueceuSenha(),
          Routes.pinValidation: (context) => const TelaValidarCadastro(),

          // Rotas principais
          Routes.home: (context) => const Home(),
          Routes.introduction: (context) => const ScreenIntroduction(),
          Routes.initial: (context) => const TelaInicial(),

          // Rotas de perfil
          Routes.profile: (context) => const TelaPerfil(),
          Routes.changePassword: (context) => const TelaAlterarSenha(),
          Routes.address: (context) => const TelaEdereco(),
          Routes.payments: (context) => const TelaPagamentos(),
          Routes.paymentHistory: (context) => const TelaHistoricoPagamentos(),
          Routes.paymentMethods: (context) => const TelaFormasPagamentos(),

          // Rotas de funcionalidades
          Routes.chat: (context) => const ChatScreen(),
          Routes.help: (context) => const TelaAjuda(),
          Routes.about: (context) => const TelaSobreFastMov(),
          Routes.favorites: (context) => const TelaFavoritos(),
          Routes.gamification: (context) => const TelaGameficacao(),
          Routes.refer: (context) => const TelaIndique(),

          // Rotas de histórico
          Routes.sessionHistory: (context) => const TelaHistoricoSessao(),
          Routes.sessionDetails: (context) => const TelaDetalhesSessao(),
          Routes.sessionReport: (context) => const TelaRelatorioSessao(),
          Routes.professionalDetails: (context) => const TelaDetalhesProfissional(),

          // Rotas de compra e assinatura
          Routes.purchase: (context) => const TelaCompraSessao(),
          Routes.finalizePurchase: (context) => const TelaFinalizarCompra(),
          Routes.subscription: (context) => const TelaAssinatura(),
          Routes.finalizeSubscription: (context) => const TelaFinalizarAssinatura(),
        },
      ),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xffF1F1F1),
      cardColor: Colors.white,
      canvasColor: const Color(0xffF3F3F4),
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
      shadowColor: const Color(0xff90949A),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      dividerColor: const Color(0xffCFCFCF),
      dividerTheme: const DividerThemeData(color: Color(0xffDCDDDF), thickness: 1),
      splashColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Color(0xff51555A),
      ),
      useMaterial3: true,
      primaryColor: const Color(0xff161934),
      // Cores de texto para tema claro
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xff2f2f2f)),
        bodyMedium: TextStyle(color: Color(0xff555555)),
        titleLarge: TextStyle(color: Color(0xff2f2f2f)),
        titleMedium: TextStyle(color: Color(0xff2f2f2f)),
        headlineMedium: TextStyle(color: Color(0xff2f2f2f)),
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xff121212),
      cardColor: const Color(0xff1E1E1E),
      canvasColor: const Color(0xff2C2C2C),
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
      shadowColor: const Color(0xff000000),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: const Color(0xff2C2C2C),
      ),
      dividerColor: const Color(0xff404040),
      dividerTheme: const DividerThemeData(color: Color(0xff404040), thickness: 1),
      splashColor: const Color(0xff2C2C2C),
      iconTheme: const IconThemeData(
        color: Color(0xffB3B3B3),
      ),
      useMaterial3: true,
      primaryColor: const Color(0xff4A90E2),
      // Cores de texto para tema escuro
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xffF5F5F5)),
        bodyMedium: TextStyle(color: Color(0xffB3B3B3)),
        titleLarge: TextStyle(color: Color(0xffF5F5F5)),
        titleMedium: TextStyle(color: Color(0xffF5F5F5)),
        headlineMedium: TextStyle(color: Color(0xffF5F5F5)),
      ),
    );
  }
}