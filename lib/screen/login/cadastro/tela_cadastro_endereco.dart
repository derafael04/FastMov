import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:fastmov/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class TelaCadastroEndereco extends StatefulWidget {
  final PageController pageController;
  const TelaCadastroEndereco({super.key, required this.pageController});

  @override
  State<TelaCadastroEndereco> createState() => _TelaCadastroEnderecoState();
}

class _TelaCadastroEnderecoState extends State<TelaCadastroEndereco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
        child: CustomButton(
          label: 'Próximo',
          type: ButtonType.primary,
          onPressed: () {
            widget.pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextTitle1('Endereço'),
                SizedBox(height: 24),
                CustomTextBody('Digite seu endereço para consultas'),
                SizedBox(height: 24),
                // Campo Cep
                CustomTextField(hintText: 'Cep'),
                SizedBox(height: 16),
            
                // Campo Endereço
                CustomTextField(hintText: 'Endereço'),
                SizedBox(height: 16),
            
                // Complemento + Número
                Row(
                  children: [
                    Expanded(child: CustomTextField(hintText: 'Complemento')),
                    SizedBox(width: 12),
                    Expanded(child: CustomTextField(hintText: 'Número')),
                  ],
                ),
                SizedBox(height: 16),
            
                // Campo Bairro
                CustomTextField(hintText: 'Bairro'),
                SizedBox(height: 16),
            
                // Estado + Cidade
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(hintText: 'Estado')
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: CustomTextField(hintText: 'Cidade')
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Campo Referência
                CustomTextField(hintText: 'Referência'),
              ],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}