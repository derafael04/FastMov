import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(title: 'Perfil',
        actions: IconButton(
          icon: const HeroIcon(HeroIcons.informationCircle),
          onPressed: () {
            Navigator.of(context).pushNamed('/telaAjuda');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 48),
                _customItens('Nome', 'Rafael Silva', () {}),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Divider(),
                ),
                _customItens('E-mail', 'fastmov@fastmov.com', () {}),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Divider(),
                ),
                _customItens('Telefone', '(11) 9 8080-7070', () {},),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(text: 'Alterar Senha', style: AppTextStyleType.subtitle),
                    IconButton(
                      onPressed: () {}, 
                      icon: const HeroIcon(HeroIcons.chevronRight, color: Color(0xFF9E9E9E), size: 20,)
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _customItens(String titulo, String subTexto, Function()? onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: titulo, style: AppTextStyleType.subtitle),
            AppText(text: subTexto, style: AppTextStyleType.body, isNotHeavy: true),
          ],
        ),
        IconButton(
          onPressed: onTap, 
          icon: const HeroIcon(HeroIcons.pencil, color: Color(0xFF9E9E9E), size: 20,)
        )
      ],
    );
  }

  bottomSheetEditPerfil(String titulo, String labelText, TextEditingController controller, Function() onTap) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Text(
                        titulo,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close, size: 24),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: labelText,
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF101233),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: onTap,
                    child: const Text(
                      'Salvar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}