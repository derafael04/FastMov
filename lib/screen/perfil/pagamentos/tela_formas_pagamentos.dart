import 'package:fastmov/screen/perfil/pagamentos/tela_cadastrarEditar_cartao.dart';
import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:fastmov/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaFormasPagamentos extends StatefulWidget {
  const TelaFormasPagamentos({super.key});

  @override
  State<TelaFormasPagamentos> createState() => _TelaFormasPagamentosState();
}

class _TelaFormasPagamentosState extends State<TelaFormasPagamentos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Formas de Pagamento',
        actions: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TelaCadastrareditarCartao(editar: false),
              ),
            );
          }, 
          icon: const HeroIcon(HeroIcons.plus, size: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCard(
              margin: EdgeInsets.zero,
              type: CardType.primary, 
              body: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 32,
                        width: 42,
                        child: Image.asset('assets/images/icon/mastercartao.png',)
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(text: 'Crédito', style: AppTextStyleType.body),
                          AppText(text: '********** 7124', style: AppTextStyleType.body, isNotHeavy: true),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      _showBottomSheet(context);
                    }, 
                    icon: const HeroIcon(HeroIcons.ellipsisVertical, size: 24),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildItem(
                icon: HeroIcons.pencil,
                label: 'Editar',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaCadastrareditarCartao(editar: true),
                    ),
                  );
                },
              ),
              const Divider(height: 1),
              _buildItem(
                icon: HeroIcons.trash,
                label: 'Excluir',
                onTap: () {
                  Navigator.pop(context);
                  _showEditAddressDialog(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItem({
    required HeroIcons icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            HeroIcon(icon, size: 24, color: Colors.black87),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditAddressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          insetPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppText(
                  text: 'Excluir Forma de Pagamento',
                  style: AppTextStyleType.subtitle,
                ),
                const SizedBox(height: 12),
                const AppText(
                  text: 'Deseja realmente excluir esse forma de pagamento?',
                  style: AppTextStyleType.bodyLarge,
                  textAlign: TextAlign.center,
                  isNotHeavy: true,
                ),
                const SizedBox(height: 32),
                // Botão Avaliar
                CustomButton(
                  label: 'Não', 
                  type: ButtonType.outline,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                CustomButton(
                  label: 'Sim', 
                  type: ButtonType.primary,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}