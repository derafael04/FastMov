import 'package:fastmov/screen/ajuda/tela_ajuda.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          primary: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/user.png'),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Rafael Silva',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      'Perfil',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              DrawerItem(icon: HeroIcons.fire, title: 'Atividades', onTap: () {}),
              DrawerItem(icon: HeroIcons.creditCard, title: 'Assinatura', onTap: () => Navigator.of(context).pushNamed('/telaAssinatura'),),
              DrawerItem(icon: HeroIcons.user, title: 'Perfil', onTap: () => Navigator.of(context).pushNamed('/telaPerfil')),
              DrawerItem(icon: HeroIcons.mapPin, title: 'Endereço', onTap: () => Navigator.of(context).pushNamed('/telaEdereco')),
              DrawerItem(icon: HeroIcons.banknotes, title: 'Pagamentos', onTap: () => Navigator.of(context).pushNamed('/telaPagamentos')),
              const Divider(),
              DrawerItem(icon: HeroIcons.arrowLeftStartOnRectangle, title: 'Sair do App', onTap: () {}),
              DrawerItem(
                icon: HeroIcons.questionMarkCircle,
                title: 'Ajuda',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaAjuda()),
                ),
              ),
              DrawerItem(icon: HeroIcons.exclamationCircle, title: 'Sobre a FastMov', onTap: () => Navigator.of(context).pushNamed('/about')),
              DrawerItem(icon: HeroIcons.documentText, title: 'Termos e Aceites', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final HeroIcons icon;
  final String title;
  final Function() onTap;

  const DrawerItem({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: HeroIcon(icon, color: const Color(0xFF8076A3)),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      onTap: onTap
    );
  }
}