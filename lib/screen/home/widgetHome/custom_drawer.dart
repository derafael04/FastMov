import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          primary: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Center(
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
              SizedBox(height: 24),
              DrawerItem(icon: HeroIcons.fire, title: 'Atividades'),
              DrawerItem(icon: HeroIcons.creditCard, title: 'Assinatura'),
              DrawerItem(icon: HeroIcons.user, title: 'Perfil'),
              DrawerItem(icon: HeroIcons.mapPin, title: 'Endereço'),
              DrawerItem(icon: HeroIcons.banknotes, title: 'Pagamentos'),
              Divider(),
              DrawerItem(icon: HeroIcons.arrowLeftStartOnRectangle, title: 'Sair do App'),
              DrawerItem(icon: HeroIcons.questionMarkCircle, title: 'Ajuda'),
              DrawerItem(icon: HeroIcons.documentText, title: 'Termos e Aceites'),
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

  const DrawerItem({super.key, required this.icon, required this.title});

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
      onTap: () {
        Navigator.pop(context); // Fecha o Drawer
        // Adicione a navegação aqui se necessário
      },
    );
  }
}