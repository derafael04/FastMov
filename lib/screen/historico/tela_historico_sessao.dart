import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_card.dart';
import 'package:fastmov/widget/custom_text_field.dart';
import 'package:fastmov/widget/data_formatter.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaHistoricoSessao extends StatefulWidget {
  const TelaHistoricoSessao({super.key});

  @override
  State<TelaHistoricoSessao> createState() => _TelaHistoricoSessaoState();
}

class _TelaHistoricoSessaoState extends State<TelaHistoricoSessao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          primary: true,
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Pesquisar',
                prefixIcon: const HeroIcon(
                  HeroIcons.magnifyingGlass,
                  color: Color(0xFF9E9E9E),
                ),
                onChanged: (valor) {},
              ),
              const SizedBox(height: 24),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/telaDetalhesSessao');
                    },
                    child: historicoSessao(
                      'Dr. João Silva',
                      'Fisioterapeuta',
                      DataFormatter.formatDiaSemanaDiaMesAbreviado(DateTime.now()),
                      '14:00 - 15:00',
                      StatusAtendimento.finalizado,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget historicoSessao(String nome, String especiallizacao, String data, String hora, StatusAtendimento status) {
    return CustomCard(
      margin: const EdgeInsets.all(0),
      type: CardType.primary,
      width: MediaQuery.of(context).size.width,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/images/userProfissional.png'),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextBody(nome),
                      CustomTextBody(especiallizacao, isHeavy: false),
                    ],
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF34C759),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeroIcon(getIconStatus(status), color: Colors.white),
                    const SizedBox(width: 4),
                    CustomTextBody(getTextoStatus(status), color: Colors.white, isHeavy: false)
                  ],
                )
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
            child: Divider(
              color: Color(0xFFD2D2D2)
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const HeroIcon(HeroIcons.calendar, size: 20, color: Color(0xFF9E9E9E),),
                  const SizedBox(width: 4),
                  CustomTextBody(data, isHeavy: false)
                ],
              ),
              Row(
                children: [
                  const HeroIcon(HeroIcons.clock, size: 20, color: Color(0xFF9E9E9E),),
                  const SizedBox(width: 4),
                  CustomTextBody(hora, isHeavy: false)
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  HeroIcons getIconStatus(StatusAtendimento status) {
    switch (status) {
      case StatusAtendimento.andamento:
        return HeroIcons.clock;
      case StatusAtendimento.finalizado:
        return HeroIcons.checkCircle;
      case StatusAtendimento.cancelado:
        return HeroIcons.xCircle;
    }
  }

  String getTextoStatus(StatusAtendimento status) {
    switch (status) {
      case StatusAtendimento.andamento:
        return 'Andamento';
      case StatusAtendimento.finalizado:
        return 'Finalizado';
      case StatusAtendimento.cancelado:
        return 'Cancelado';
    }
  }
}

enum StatusAtendimento {
  andamento,
  finalizado,
  cancelado
}