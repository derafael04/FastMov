import 'package:fastmov/screen/favoritos/tela_favoritos.dart';
import 'package:fastmov/screen/gameficacao/tela_gameficacao.dart';
import 'package:fastmov/screen/historico/tela_historico_sessao.dart';
import 'package:fastmov/screen/home/tela_inicial.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    TelaInicial(),
    TelaFavoritos(),
    TelaHistoricoSessao(),
    TelaGameficacao(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  HeroIcons _getIcon(int index) {
    switch (index) {
      case 0:
        return HeroIcons.home;
      case 1:
        return HeroIcons.heart;
      case 2:
        return HeroIcons.receiptRefund;
      case 3:
        return HeroIcons.trophy;
      default:
        return HeroIcons.home;
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Início';
      case 1:
        return 'Favoritos';
      case 2:
        return 'Histórico';
      case 3:
        return 'Ranking';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            final isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () => _onItemTapped(index),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: HeroIcon(
                      _getIcon(index),
                      key: ValueKey('icon_$index$isSelected'),
                      color: isSelected ? const Color(0xFF1C1C43) : Colors.grey,
                      size: 24,
                      style: isSelected
                          ? HeroIconStyle.solid
                          : HeroIconStyle.outline,
                    ),
                  ),
                  const SizedBox(height: 2),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: isSelected
                        ? Text(
                            _getLabel(index),
                            key: ValueKey('label_$index'),
                            style: const TextStyle(
                              color: Color(0xFF1C1C43),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : const SizedBox(height: 0),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}