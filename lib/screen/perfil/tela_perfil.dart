import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:fastmov/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerTelefone = TextEditingController();

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
                _customItens('Nome', 'Rafael Silva', () {
                  bottomSheetEditPerfil(
                    'Alterar nome',
                    'Nome completo',
                    _controllerNome,
                    () => Navigator.of(context).pop()
                  );
                }),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Divider(),
                ),
                _customItens('E-mail', 'fastmov@fastmov.com', () {
                  bottomSheetEditPerfil(
                    'Alterar e-mail',
                    'E-mail',
                    _controllerEmail,
                    () => Navigator.of(context).pop()
                  );
                }),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Divider(),
                ),
                _customItens('Telefone', '(11) 9 8080-7070', () {
                  bottomSheetEditPerfil(
                    'Alterar Telefone',
                    'Telefone',
                    _controllerTelefone,
                    () => Navigator.of(context).pop()
                  );
                },),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(text: 'Alterar Senha', style: AppTextStyleType.subtitle),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/telaAlterarSenha');
                      }, 
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
    return InkWell(
      onTap: onTap,
      child: Row(
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
          const HeroIcon(HeroIcons.pencil, color: Color(0xFF9E9E9E), size: 20,)
        ],
      ),
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
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
                  child: CustomTextField(
                    hintText: labelText,
                    controller: controller,
                    onChanged: (p0) {},
                  ),
                ),
                CustomButton(label: 'Salvar', type: ButtonType.primary,
                  onPressed: onTap,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}