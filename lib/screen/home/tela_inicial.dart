import 'package:fastmov/screen/home/widgetHome/item_card_indicacao.dart';
import 'package:fastmov/screen/home/widgetHome/item_card_ofertas.dart';
import 'package:fastmov/screen/home/widgetHome/item_nossos_servicos.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 24, 0, 24),
        child: Column(
          spacing: 16,
          children: [
            ItemCardIndicacao(),
            ItemCardOfertas(),
            ItemNossosServicos()
          ],
        ),
      ),
    );
  }
}