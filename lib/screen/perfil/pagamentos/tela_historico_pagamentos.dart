import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaHistoricoPagamentos extends StatefulWidget {
  const TelaHistoricoPagamentos({super.key});

  @override
  State<TelaHistoricoPagamentos> createState() => _TelaHistoricoPagamentosState();
}

class _TelaHistoricoPagamentosState extends State<TelaHistoricoPagamentos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Histórico de pagamentos',
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
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _pagamentos(
                  title: 'Sessão - 1 unit',
                  subtitle: 'Crédito',
                  data: '14/10/2024 ás 14:30',
                  valor: 'R\$ 180,00'
                );
              },
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Divider(),
              ), 
              itemCount: 3
            )
          ],
        ),
      ),
    );
  }

  Widget _pagamentos({required String title, required String subtitle, required String data, required String valor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(text: title, style: AppTextStyleType.bodyStrong),
              AppText(text: subtitle, style: AppTextStyleType.label, isNotHeavy: true),
              AppText(text: data, style: AppTextStyleType.label, isNotHeavy: true),
            ],
          ),
        ),
        AppText(text: valor, style: AppTextStyleType.bodyStrong),
      ],
    );
  }
}