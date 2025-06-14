import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaRelatorioSessao extends StatelessWidget {
  const TelaRelatorioSessao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Detalhes do Agendamento',
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: SingleChildScrollView(
          primary: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              const CustomCard(
                type: CardType.primary,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                width: double.infinity, 
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextBodyStrong('Atendimento'),
                    SizedBox(height: 24),
                    CustomTextBody('Procedimento'),
                    CustomTextCaption1('Liberação Miofascial'),
                    SizedBox(height: 16),
                    CustomTextBody('Observação'),
                    CustomTextCaption1('Sit at, Nam in vel sit Lorem tincidunt Praesent efficitur. hendrerit lorem. nisi faucibus odio ipsum id elementum volutpat quis Quisque luctus laoreet lacus, Nunc dui turpis ipsum amet, placerat ex. elit. felis, sollicitudin. eget consectetur non '),
                  ],
                )
              ),
              CustomCard(
                type: CardType.primary,
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                width: double.infinity, 
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextSubheadline('Atendimento'),
                    const SizedBox(height: 24),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return _itemAtividades('Movimento de Pinça', 'Fortalecimento do polegar e dedos indicador para atividades do dia a dia.');
                      },
                      itemCount: 4,
                      separatorBuilder: (context, index) => const SizedBox(height: 8),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemAtividades(String titulo, String texto) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextBody(titulo),
              CustomTextCaption1(texto),
            ],
          ),
        ),
        const HeroIcon(HeroIcons.chevronRight, size: 20)
      ],
    );
  }
}