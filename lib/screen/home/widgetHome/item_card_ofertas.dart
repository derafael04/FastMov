import 'package:fastmov/widget/card_anuncio.dart';
import 'package:fastmov/widget/custom_app_text.dart';
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
            height: 156,
            child: ListView.separated(
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const CardAnuncio();
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