import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaCadastrareditarCartao extends StatefulWidget {
  final bool editar;
  const TelaCadastrareditarCartao({super.key, this.editar = false});

  @override
  State<TelaCadastrareditarCartao> createState() => _TelaCadastrareditarCartaoState();
}

class _TelaCadastrareditarCartaoState extends State<TelaCadastrareditarCartao> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController validadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.editar ? 'Editar Cartão' : 'Cadastrar Cartão',
        actions: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/telaAjuda');
          }, 
          icon: const HeroIcon(HeroIcons.informationCircle, size: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              //height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: widget.editar
                      ? [const Color(0xFFBAB7CA), const Color(0xFF6868AC)]
                      : [const Color(0xFFD9D9D9), const Color(0xFFB0B0B0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: nomeController.text.isNotEmpty ? nomeController.text : 'Nome Impresso', style: AppTextStyleType.bodyLarge, color: Colors.white),
                  const SizedBox(height: 16),
                  AppText(text: numeroController.text.isNotEmpty ? numeroController.text : '0000 0000 0000 0000', style: AppTextStyleType.title, color: Colors.white),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(text: cvvController.text.isNotEmpty ? cvvController.text : 'cvv', style: AppTextStyleType.bodyStrong, color: Colors.white),
                      widget.editar
                      ? SizedBox(
                          height: 32,
                          width: 42,
                          child: Image.asset('assets/images/icon/mastercartao.png',)
                        )
                      : const SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(hintText: 'Número do cartão*', controller: numeroController, onChanged: (p0) => setState(() {})),
            const SizedBox(height: 16),
            CustomTextField(hintText: 'Nome no cartão*', controller: nomeController, onChanged: (p0) => setState(() {})),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(child: CustomTextField(hintText: 'Vencimento*')),
                const SizedBox(width: 12),
                Expanded(child: CustomTextField(hintText: 'CVV*', controller: cvvController, onChanged: (p0) => setState(() {}))),
              ],
            ),
            const SizedBox(height: 16),
            const CustomTextField(hintText: 'CPF*'),
          ],
        ),
      ),
    );
  }
}