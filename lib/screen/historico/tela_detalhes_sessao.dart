import 'package:fastmov/screen/historico/rating_modal.dart';
import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:fastmov/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TelaDetalhesSessao extends StatefulWidget {
  const TelaDetalhesSessao({super.key});

  @override
  State<TelaDetalhesSessao> createState() => _TelaDetalhesSessaoState();
}

class _TelaDetalhesSessaoState extends State<TelaDetalhesSessao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: 'Detalhes do Agendamento',
        actions: IconButton(
            icon: const HeroIcon(HeroIcons.chatBubbleLeftRight),
            onPressed: () {
              Navigator.of(context).pushNamed('/chatScreen');
            },
          ), 
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          primary: true,
          child: Column(
            spacing: 24,
            children: [
              CustomCard(
                type: CardType.primary,
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                width: double.infinity,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextSubheadline('Em andamento'),
                            //SizedBox(height: 4),
                            CustomTextCaption1('Aguardando a sessão iniciar', isHeavy: false),
                          ],
                        ),
                        HeroIcon(HeroIcons.chevronDown, size: 24,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                      child: StepProgressIndicator(
                        totalSteps: 100,
                        currentStep: 32,
                        size: 8,
                        padding: 0,
                        selectedColor: Theme.of(context).primaryColor,
                        unselectedColor: const Color(0xffE9E8EE),
                        roundedEdges: const Radius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      label: 'Relatorio',
                      type: ButtonType.primary,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/telaRelatorioSessao');
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      label: 'Avaliar Consulta',
                      type: ButtonType.outline,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => const RatingModal(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const CustomCard(
                type: CardType.primary,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                width: double.infinity,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextSubheadline('Resumo da compra'),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextBodyStrong('Agendamento'),
                            CustomTextCaption1('11/08/2014 às 09:00 - 10:00', isHeavy: false),
                          ],
                        ),
                        //AppText(text: '14h00 - 15h00', style: AppTextStyleType.caption, isNotHeavy: true),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Divider(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextBodyStrong('Pagamento'),
                            CustomTextCaption1('Valor Total', isHeavy: false),
                          ],
                        ),
                        CustomTextCaption1('R\$180,00', isHeavy: false),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Divider(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextBodyStrong('Endereço'),
                        CustomTextBody('R. Padre Chico'),
                        CustomTextCaption1('Pompeia - Cond. Viena apart 1801 - São Paulo - SP', isHeavy: false),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9), // cinza claro
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Seu código da sessão:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'GT45Y',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D0C2B), // azul escuro quase preto
                    ),
                  ),
                ],
              ),
            ),
             CustomCard(
                type: CardType.primary,
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                width: double.infinity,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundImage: AssetImage('assets/images/userProfissional.png'),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextBodyStrong('Márcio André'),
                                CustomTextCaption1('Fisioterapeuta', isHeavy: false),
                              ],
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            // Navegar para a tela de detalhes do profissional
                            Navigator.pushNamed(context, '/telaDetalhesProfissional');
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Detalhes',
                                    style: TextStyle(
                                      color: Color(0xFF6B5BA5), // tom de roxo
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.chevron_right,
                                color: Color(0xFF6B5BA5),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }
}