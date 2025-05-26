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
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.purple,
                      child: Icon(Icons.person, color: Colors.white, size: 32),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rafael Silva',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
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
              DrawerItem(icon: HeroIcons.creditCard, title: 'Assinatura', onTap: () {},),
              DrawerItem(icon: HeroIcons.user, title: 'Perfil', onTap: () => Navigator.of(context).pushNamed('/telaPerfil')),
              DrawerItem(icon: HeroIcons.mapPin, title: 'Endereço', onTap: () => Navigator.of(context).pushNamed('/telaEdereco')),
              DrawerItem(icon: HeroIcons.banknotes, title: 'Pagamentos', onTap: () {}),
              const Divider(),
              DrawerItem(icon: HeroIcons.arrowLeftStartOnRectangle, title: 'Sair do App', onTap: () {}),
              DrawerItem(icon: HeroIcons.questionMarkCircle, title: 'Ajuda', onTap: () {}),
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