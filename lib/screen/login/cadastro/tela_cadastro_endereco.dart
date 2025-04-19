import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:fastmov/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class TelaCadastroEndereco extends StatefulWidget {
  const TelaCadastroEndereco({super.key});

  @override
  State<TelaCadastroEndereco> createState() => _TelaCadastroEnderecoState();
}

class _TelaCadastroEnderecoState extends State<TelaCadastroEndereco> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'Endereço',
                style: AppTextStyleType.title,
              ),
              SizedBox(height: 24),
              AppText(
                text: 'Digite seu endereço para consultas',
                style: AppTextStyleType.bodyLarge,
              ),
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
          CustomButton(
            label: 'Próximo',
            type: ButtonType.primary,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}