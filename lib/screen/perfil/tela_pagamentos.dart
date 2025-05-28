import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaPagamentos extends StatefulWidget {
  const TelaPagamentos({super.key});

  @override
  State<TelaPagamentos> createState() => _TelaPagamentosState();
}

class _TelaPagamentosState extends State<TelaPagamentos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Endereços',
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
            _itens(
              title: 'Histórico de pagamentos',
              subtitle: 'Verificar todo o histórico de pagamento',
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Divider(),
            ),
            _itens(
              title: 'Cadastro do cartão',
              subtitle: 'Verificar todos cartões cadastrados no aplicativo',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  Row _itens({required String title, required String subtitle, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(text: title, style: AppTextStyleType.subtitle),
              AppText(text: subtitle, style: AppTextStyleType.body, isNotHeavy: true),
            ],
          ),
        ),
        IconButton(
          onPressed: onTap, 
          icon: const HeroIcon(HeroIcons.chevronRight, size: 24),
        ),
      ],
    );
  }
}