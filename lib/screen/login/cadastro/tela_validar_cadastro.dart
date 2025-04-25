import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:pinput/pinput.dart';

class TelaValidarCadastro extends StatefulWidget {
  const TelaValidarCadastro({super.key});

  @override
  State<TelaValidarCadastro> createState() => _TelaValidarCadastroState();
}

class _TelaValidarCadastroState extends State<TelaValidarCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Verificar',
        leading: IconButton(
          icon: const HeroIcon(HeroIcons.informationCircle),
          onPressed: () {
            Navigator.pushNamed(context, '/telaAjuda');
          },
          color: Theme.of(context).primaryColor,
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              label: 'Finalizar',
              type: ButtonType.primary,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeroIcon(
              HeroIcons.chatBubbleLeftEllipsis,
              size: 32,
            ),
            const SizedBox(height: 24),
            const Text.rich(
              TextSpan(
                text: 'Enter the verification code that we sent to ',
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(
                    text: '+62 855 – 9729 – 8172',
                    style: TextStyle(
                      color: Color(0xFF1C1C43),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            Pinput(
              length: 4,
              defaultPinTheme: PinTheme(
                width: 48,
                height: 48,
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFD2D2D2)),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              separatorBuilder: (index) => const SizedBox(width: 16),
              onCompleted: (pin) {},
            ),
          ],
        ),
      ),
    );
  }
}