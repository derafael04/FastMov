import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:fastmov/widget/custom_card.dart';
import 'package:fastmov/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaFavoritos extends StatefulWidget {
  const TelaFavoritos({super.key});

  @override
  State<TelaFavoritos> createState() => _TelaFavoritosState();
}

class _TelaFavoritosState extends State<TelaFavoritos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: SingleChildScrollView(
          primary: true,
          physics: const BouncingScrollPhysics(),
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
                itemBuilder: (context, index) {
                  return _itemFavorito(
                    'Márcio André',
                    'Fisioterapeuta',
                    '4.5',
                    '1.9'
                  );
                }, 
                separatorBuilder: (context, index) => const SizedBox(height: 16), 
                itemCount: 3
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemFavorito(String nome, String especiallizacao, String nota, String distanciaAtendimento) {
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
                      AppText(text: nome, style: AppTextStyleType.bodyLarge),
                      AppText(text: especiallizacao, style: AppTextStyleType.body, isNotHeavy: true),
                      Row(
                        children: [
                          Row(
                            children: [
                              const HeroIcon(HeroIcons.star, size: 14, color: Color(0xffFFCC00), style: HeroIconStyle.solid,),
                              AppText(text: nota, style: AppTextStyleType.label),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              const HeroIcon(HeroIcons.mapPin, size: 14,),
                              AppText(text: distanciaAtendimento, style: AppTextStyleType.label),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              InkWell(
                onTap: () {},
                child: HeroIcon(HeroIcons.heart, color: Theme.of(context).primaryColor, size: 28, style: HeroIconStyle.solid,)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: CustomButton(
              label: 'Agendar Consulta', 
              type: ButtonType.outline,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}