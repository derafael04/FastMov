import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_card.dart';
import 'package:flutter/material.dart';

class ItemCardOfertas extends StatefulWidget {
  const ItemCardOfertas({super.key});

  @override
  State<ItemCardOfertas> createState() => _ItemCardOfertasState();
}

class _ItemCardOfertasState extends State<ItemCardOfertas> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(text: '#EspecialParaVocê', style: AppTextStyleType.subtitle),
          const SizedBox(height: 8),
          SizedBox(
            height: 220,
            child: ListView.separated(
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomCard(
                  height: 160,
                  width: MediaQuery.of(context).size.width - 32,
                  type: CardType.primary,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover,
                  ),
                  body: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Banner "Última oportunidade"
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Última oportunidade',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Spacer(),
                          // Texto principal
                          const Text(
                            '2 Sessões no mês\nR\$ 330,00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Botão "Detalhes"
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1C1C43), // Azul escuro igual na imagem
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Detalhes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8), 
              itemCount: 3
            ),
          )
        ],
      ),
    );
  }
}