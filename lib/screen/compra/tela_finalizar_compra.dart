import 'package:fastmov/screen/perfil/pagamentos/tela_cadastrarEditar_cartao.dart';
import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaFinalizarCompra extends StatefulWidget {
  const TelaFinalizarCompra({super.key});

  @override
  State<TelaFinalizarCompra> createState() => _TelaFinalizarCompraState();
}

class _TelaFinalizarCompraState extends State<TelaFinalizarCompra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Finalização',
        actions: IconButton(
          icon: const HeroIcon(HeroIcons.informationCircle),
          onPressed: () {
            Navigator.of(context).pushNamed('/telaAjuda');
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 24,
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
            const CustomCard(
              type: CardType.primary, 
              margin: EdgeInsets.zero,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextHeadline('Agendamento'),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          HeroIcon(HeroIcons.calendarDays),
                          SizedBox(width: 8),
                          CustomTextBody('20/10/2023', isHeavy: false),
                        ],
                      ),
                      Row(
                        children: [
                          HeroIcon(HeroIcons.clock),
                          SizedBox(width: 8),
                          CustomTextBody('09:00 - 10:00', isHeavy: false),
                        ],
                      )
                    ],
                  ),
                ],
              )
            ),
            CustomCard(
              type: CardType.primary, 
              margin: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextHeadline('Forma de pagamento'),
                  const SizedBox(height: 4),
                  const CustomTextCaption1('Selecione a sua forma de pagamento'),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 32,
                        width: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xffF2F2F2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 18,
                            width: 18,
                            child: Image.asset('assets/images/icon/mastercartao.png')),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextBody('Crédito'),
                          CustomTextBody('********** 7124', isHeavy: false),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TelaCadastrareditarCartao(editar: false),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: const Row(
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
                    ],
                  )
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white, // Cor de fundo clara
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cupom desconto',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 1,
                        color: Theme.of(context).dividerColor,
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerRight,
                        ),
                        child: const Text(
                          'Ativar',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomCard(
              type: CardType.primary, 
              margin: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextHeadline('Resumo da compra'),
                  const SizedBox(height: 16),
                  _itens(title: 'Assinatura', value: 'R\$ 129,90'),
                  _itens(title: 'Taxa', value: 'R\$ 00,00'),
                  _itens(title: 'Desconto', value: 'R\$ 00,00'),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextBody('Valor Total'),
                      CustomTextBody('R\$ 129,90'),
                    ],
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  Widget _itens({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextCaption1(title),
        CustomTextCaption1(value),
      ],
    );
  }
}