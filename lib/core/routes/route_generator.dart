import 'package:flutter/material.dart';

import '../../data/models/faq_model.dart';
import '../../screen/ajuda/tela_ajuda.dart';
import '../../screen/ajuda/tela_detalhes_pergunta.dart';
import '../../screen/assinatura/tela_assinatura.dart';
import '../../screen/assinatura/tela_finalizar_assinatura.dart';
import '../../screen/chat/tela_chat.dart';
import '../../screen/compra/tela_compra.dart';
import '../../screen/compra/tela_finalizar_compra.dart';
import '../../screen/favoritos/tela_favoritos.dart';
import '../../screen/gameficacao/tela_gameficacao.dart';
import '../../screen/historico/tela_detalhes_profissional.dart';
import '../../screen/historico/tela_detalhes_sessao.dart';
import '../../screen/historico/tela_historico_sessao.dart';
import '../../screen/historico/tela_relatorio_sessao.dart';
import '../../screen/home/screen_home.dart';
import '../../screen/home/screen_introduction.dart';
import '../../screen/home/tela_indique.dart';
import '../../screen/home/tela_inicial.dart';
import '../../screen/login/cadastro/tela_cadastro_login.dart';
import '../../screen/login/cadastro/tela_validar_cadastro.dart';
import '../../screen/login/tela_esqueceu_senha.dart';
import '../../screen/login/tela_login_inicial.dart';
import '../../screen/perfil/endereco/tela_edereco.dart';
import '../../screen/perfil/pagamentos/tela_formas_pagamentos.dart';
import '../../screen/perfil/pagamentos/tela_historico_pagamentos.dart';
import '../../screen/perfil/pagamentos/tela_pagamentos.dart';
import '../../screen/perfil/tela_alterar_senha.dart';
import '../../screen/perfil/tela_perfil.dart';
import 'app_routes.dart';

/// Gerador de rotas da aplicação
class RouteGenerator {
  /// Gera as rotas baseado no nome da rota
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';
    final dynamic arguments = settings.arguments;

    // Log da navegação (apenas em debug)
    debugPrint('Navegando para: $routeName');

    switch (routeName) {
      // Rotas de autenticação
      case AppRoutes.login:
        return _createRoute(const TelaLoginInicial());

      case AppRoutes.register:
        return _createRoute(const TelaCadastroLogin());

      case AppRoutes.forgotPassword:
        return _createRoute(const TelaEsqueceuSenha());

      case AppRoutes.pinValidation:
        return _createRoute(const TelaValidarCadastro());

      // Rotas principais
      case AppRoutes.home:
        return _createRoute(const Home());

      case AppRoutes.introduction:
        return _createRoute(const ScreenIntroduction());

      case AppRoutes.initial:
        return _createRoute(const TelaInicial());

      // Rotas de perfil
      case AppRoutes.profile:
        return _createRoute(const TelaPerfil());

      case AppRoutes.changePassword:
        return _createRoute(const TelaAlterarSenha());

      case AppRoutes.address:
        return _createRoute(const TelaEdereco());

      case AppRoutes.payments:
        return _createRoute(const TelaPagamentos());

      case AppRoutes.paymentHistory:
        return _createRoute(const TelaHistoricoPagamentos());

      case AppRoutes.paymentMethods:
        return _createRoute(const TelaFormasPagamentos());

      // Rotas de funcionalidades
      case AppRoutes.chat:
        return _createRoute(const ChatScreen());

      case AppRoutes.help:
        return _createRoute(const TelaAjuda());

      case AppRoutes.helpDetails:
        final question = arguments as FaqQuestionModel?;
        if (question != null) {
          return _createRoute(TelaDetalhesPergunta(question: question));
        }
        return _createRoute(_buildErrorPage('Pergunta não encontrada'));

      case AppRoutes.favorites:
        return _createRoute(const TelaFavoritos());

      case AppRoutes.gamification:
        return _createRoute(const TelaGameficacao());

      case AppRoutes.refer:
        return _createRoute(const TelaIndique());

      // Rotas de histórico
      case AppRoutes.sessionHistory:
        return _createRoute(const TelaHistoricoSessao());

      case AppRoutes.sessionDetails:
        return _createRoute(const TelaDetalhesSessao());

      case AppRoutes.sessionReport:
        return _createRoute(const TelaRelatorioSessao());

      case AppRoutes.professionalDetails:
        return _createRoute(const TelaDetalhesProfissional());

      // Rotas de compra e assinatura
      case AppRoutes.purchase:
        return _createRoute(const TelaCompraSessao());

      case AppRoutes.finalizePurchase:
        return _createRoute(const TelaFinalizarCompra());

      case AppRoutes.subscription:
        return _createRoute(const TelaAssinatura());

      case AppRoutes.finalizeSubscription:
        return _createRoute(const TelaFinalizarAssinatura());

      // Rota padrão (fallback)
      default:
        return _createRoute(_buildErrorPage(routeName));
    }
  }

  /// Cria uma rota com transição personalizada
  static PageRoute<dynamic> _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Transição de slide da direita para esquerda
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }



  /// Constrói uma página de erro para rotas não encontradas
  static Widget _buildErrorPage(String routeName) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Erro'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              const Text(
                'Página não encontrada',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'A rota "$routeName" não existe.',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Volta para a tela inicial
                  Navigator.of(navigatorKey.currentContext!)
                      .pushNamedAndRemoveUntil(
                    AppRoutes.login,
                    (route) => false,
                  );
                },
                child: const Text('Voltar ao Início'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Chave global do navigator para navegação sem contexto
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
