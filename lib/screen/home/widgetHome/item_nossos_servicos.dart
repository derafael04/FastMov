import 'package:fastmov/widget/custom_app_text.dart';
import 'package:flutter/material.dart';

class ItemNossosServicos extends StatefulWidget {
  const ItemNossosServicos({super.key});

  @override
  State<ItemNossosServicos> createState() => _ItemNossosServicosState();
}

class _ItemNossosServicosState extends State<ItemNossosServicos> {

  final List<ServicesItem> servicos = [
    ServicesItem(
      titulo: 'Liberação Miofascial',
      imagem: 'assets/images/icon/liberacao.png',
    ),
    ServicesItem(
      titulo: 'Pós Operatório',
      imagem: 'assets/images/icon/pos.png',
    ),
    ServicesItem(
      titulo: 'Fisioterapia Esportiva',
      imagem: 'assets/images/icon/gym.png',
    ),
    ServicesItem(
      titulo: 'Acuputura',
      imagem: 'assets/images/icon/acuputura.png',
    ),
    ServicesItem(
      titulo: 'Prevenção',
      imagem: 'assets/images/icon/prevencao.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(text: '#NossosServiços', style: AppTextStyleType.subtitle),
          const SizedBox(height: 12),
          SizedBox(
            height: 156,
            child: ListView.separated(
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _creatServiceItens(titulo: servicos[index].titulo, imagem: servicos[index].imagem);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8), 
              itemCount: servicos.length
            ),
          )
        ],
      ),
    );
  }

  _creatServiceItens({required String titulo, required String imagem}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.white,
          child: Image.asset(imagem, width: 32, height: 32),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 100,
          child: AppText(text: titulo, style: AppTextStyleType.bodyStrong, textAlign: TextAlign.center,))
      ],
    );
  }
}

class ServicesItem {
  final String titulo;
  final String imagem;

  ServicesItem({required this.titulo, required this.imagem});
  
}