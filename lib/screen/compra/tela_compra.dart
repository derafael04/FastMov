import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:flutter/material.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_card.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:heroicons/heroicons.dart';

class TelaCompraSessao extends StatefulWidget {
  const TelaCompraSessao({super.key});

  @override
  State<TelaCompraSessao> createState() => _TelaCompraSessaoState();
}

class _TelaCompraSessaoState extends State<TelaCompraSessao> {
  int quantidadeClientes = 1;
  int selectedDay = 1;
  int? selectedHorario;
  final List<String> horarios = [
    '08:00', '08:30', '09:00', '10:00',
    '10:30', '11:00', '11:30', '12:00',
    '13:00', '13:30', '14:00', '14:30',
    '15:00', '15:30', '16:00', '16:30',
    '17:00', '17:30', '18:00', '18:30', '19:00', '19:30',
  ];
  String selectedSexo = 'Homem';
  final List<String> sexos = ['Homem', 'Mulher', 'Outro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      appBar: const CustomAppBar(title: 'Agendar consulta'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomCard(
              type: CardType.primary,
              margin: EdgeInsets.zero,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextBodyStrong('Endereço para consulta'),
                  const SizedBox(height: 4),
                  const CustomTextBody('R. Padre Chico'),
                  const CustomTextCaption1('Pompeia - Cond. Viena apart 1801 - São Paulo - Sp', isHeavy: false),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child:  const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Trocar',
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
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            CustomCard(
              type: CardType.primary,
              margin: EdgeInsets.zero,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextHeadline('Quantidade de clientes', isHeavy: false),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded( child: CustomTextCaption1('Selecione quantos clientes vão ter o atendimento', isHeavy: false)),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: quantidadeClientes > 1 ? () => setState(() => quantidadeClientes--) : null,
                          ),
                          CustomTextBody(quantidadeClientes.toString()),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () => setState(() => quantidadeClientes++),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextHeadline('Dia selecionado', isHeavy: false),
                      Row(
                        children: [
                          HeroIcon(HeroIcons.calendar, size: 16, color: Color(0xFF6B5BA5)),
                          SizedBox(width: 4),
                          CustomTextCaption1('02/10/2024', isHeavy: false),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 58,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, i) {
                        final dias = ['1', '2', '3', '4', '5', '6', '7'];
                        final semana = ['TER', 'QUA', 'QUI', 'SEX', 'SAB', 'DOM', 'SEG'];
                        return GestureDetector(
                          onTap: () => setState(() => selectedDay = i),
                          child: Container(
                            width: 48,
                            decoration: BoxDecoration(
                              color: selectedDay == i ? const Color(0xFF6B5BA5) : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xFFB3B3B3)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextBody(dias[i], color: selectedDay == i ? Colors.white : const Color(0xFF161934)),
                                CustomTextCaption1(semana[i], isHeavy: false, color: selectedDay == i ? Colors.white : const Color(0xFFB3B3B3)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 12),
            CustomCard(
              type: CardType.primary,
              margin: EdgeInsets.zero,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextHeadline('Selecione o horário de atendimento', isHeavy: false),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(horarios.length, (i) {
                      return GestureDetector(
                        onTap: () => setState(() => selectedHorario = i),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: selectedHorario == i ? const Color(0xFF6B5BA5) : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFB3B3B3)),
                          ),
                          child: CustomTextBody(horarios[i], color: selectedHorario == i ? Colors.white : const Color(0xFF161934)),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            CustomCard(
              type: CardType.primary,
              margin: EdgeInsets.zero,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextHeadline('Sexo do(a) atendente', isHeavy: false),
                  DropdownButton<String>(
                    value: selectedSexo,
                    icon: const HeroIcon(HeroIcons.chevronDown),
                    isExpanded: true,
                    underline: Container(),
                    items: sexos.map((sexo) => DropdownMenuItem(
                      value: sexo,
                      child: CustomTextBody(sexo),
                    )).toList(),
                    onChanged: (value) {
                      if (value != null) setState(() => selectedSexo = value);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            CustomCard(
              type: CardType.primary,
              margin: EdgeInsets.zero,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextBodyStrong('Detalhes do pagamento'),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomTextBody('Clientes', isHeavy: false),
                      CustomTextBody(quantidadeClientes.toString(), isHeavy: false),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextBody('Horário flexível', isHeavy: false),
                      CustomTextBody('R\$ 0,00', isHeavy: false),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextBody('Horário padrão', isHeavy: false),
                      CustomTextBody('R\$ 180,00', isHeavy: false),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: CustomButton(
              label: 'Avançar',
              type: ButtonType.primary,
              onPressed: () {
                Navigator.of(context).pushNamed('/telaFinalizarCompra');
              },
            ),
          ),
        ],
      ),
    );
  }
}