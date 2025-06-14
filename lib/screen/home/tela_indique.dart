import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:fastmov/widget/stepItens.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaIndique extends StatefulWidget {
  const TelaIndique({super.key});

  @override
  State<TelaIndique> createState() => _TelaIndiqueState();
}

class _TelaIndiqueState extends State<TelaIndique> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Indique e Ganhe',
        actions: IconButton(
          icon: const HeroIcon(HeroIcons.informationCircle),
          onPressed: () {
            Navigator.of(context).pushNamed('/telaAjuda');
          },
        ),
      ),
      body: SingleChildScrollView(
        primary: true,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
          child: Column(
            spacing: 16,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/indiqueamigos.png'), fit: BoxFit.fitWidth),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    CustomTextTitle1('Convide seus amigos e ganhe recompensas', textAlign: TextAlign.start),
                    CustomTextCaption1('Compartilhe seu link de indicação com amigos. Quando eles se cadastrarem e concluírem a primeira compra, vocês dois ganham uma recompensa!', textAlign: TextAlign.start, color: Color(0xff9E9E9E)),
                    CustomTextSubheadline('Como funciona', textAlign: TextAlign.start),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StepItem(
                          icon: HeroIcons.share,
                          title: 'Compartilhe seu link',
                          subtitle: 'Compartilhe seu link de indicação exclusivo com amigos por meio de redes sociais, e-mail ou mensagens.',
                        ),
                        SizedBox(height: 16),
                        StepItem(
                          icon: HeroIcons.userPlus,
                          title: 'Amigos se cadastram',
                          subtitle: 'Seus amigos se inscrevem usando seu link e fazem a primeira compra.',
                        ),
                        SizedBox(height: 16),
                        StepItem(
                          icon: HeroIcons.giftTop,
                          title: 'Ganhe recompensas',
                          subtitle: 'Quando seu amigo concluir a primeira compra, vocês dois receberão uma recompensa.',
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: CustomButton(
          label: 'Compartilhar meu link', 
          type: ButtonType.primary,
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ),
    );
  }
}