import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:flutter/material.dart';

class TelaAjuda extends StatefulWidget {
  const TelaAjuda({super.key});

  @override
  State<TelaAjuda> createState() => _TelaAjudaState();
}

class _TelaAjudaState extends State<TelaAjuda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Ajuda',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomTextTitle2('Artigos mais lidos com frequência'),
            const SizedBox(height: 24),
            buildArticle(
              'Como redefinir a senha',
              'Se você esquecer sua senha, poderá solicitar a redefinição via e-mail ou pelo número que você cadastrou',
            ),
          ],
        ),
      ),
    );
  }

  Column buildArticle(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.book_outlined, size: 24),
            const SizedBox(width: 8),
            CustomTextBodyStrong(title)
          ],
        ),
        const SizedBox(height: 8),
        CustomTextCaption1(description, isHeavy: false),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Divider(
            color: const Color(0xFF000222).withValues(alpha: 0.1),
            height: 24,
          ),
        ),
      ],
    );
  }
}