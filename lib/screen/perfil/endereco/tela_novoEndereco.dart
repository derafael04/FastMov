import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:fastmov/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaCadastroEndereco extends StatefulWidget {
  final bool editar;
  const TelaCadastroEndereco({super.key, this.editar = false});

  @override
  State<TelaCadastroEndereco> createState() => _TelaCadastroEnderecoState();
}

class _TelaCadastroEnderecoState extends State<TelaCadastroEndereco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.editar ? 'Editar Endereço' : 'Novo Endereço',
        actions: IconButton(
          icon: const HeroIcon(HeroIcons.informationCircle),
          onPressed: () {
            Navigator.of(context).pushNamed('/telaAjuda');
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          label: widget.editar ? 'Salvar' : 'Cadastrar', 
          type: ButtonType.primary,
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ),
    );
  }
}