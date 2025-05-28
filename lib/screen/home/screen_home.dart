import 'package:fastmov/screen/favoritos/tela_favoritos.dart';
import 'package:fastmov/screen/gameficacao/tela_gameficacao.dart';
import 'package:fastmov/screen/historico/tela_historico_sessao.dart';
import 'package:fastmov/screen/home/tela_inicial.dart';
import 'package:fastmov/screen/home/widgetHome/custom_drawer.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _pages = const [
    TelaInicial(),
    TelaFavoritos(),
    TelaHistoricoSessao(),
    TelaGameficacao(),
  ];

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

  Widget _getTitle(int index) {
    switch (index) {
      case 0:
        return Text('FastMov',
          style: GoogleFonts.outfit(
            fontSize: 32,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF6868AC)
          ),
        );
      case 1:
        return const AppText(
          text: 'Favoritos',
          style: AppTextStyleType.bodyLarge
        );
      case 2:
        return const AppText(
          text: 'Histórico',
          style: AppTextStyleType.bodyLarge
        );
      case 3:
        return const AppText(
          text: 'Ranking',
          style: AppTextStyleType.bodyLarge
        );
      default:
        return Text('FastMov',
          style: GoogleFonts.outfit(
            fontSize: 32,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF6868AC)
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF1F1F1),
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: _getTitle(_selectedIndex),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const HeroIcon(HeroIcons.bell),
            onPressed: () {},
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => _scaffoldKey.currentState?.openDrawer(),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
              radius: 18,
            ),
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _selectedIndex = index),
        children: _pages,
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
              onTap: () {
                _pageController.jumpToPage(index);
              },
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeroIcon(
                    _getIcon(index),
                    key: ValueKey('icon_$index$isSelected'),
                    color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
                    size: 24,
                  ),
                  const SizedBox(height: 2),
                  isSelected
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
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}