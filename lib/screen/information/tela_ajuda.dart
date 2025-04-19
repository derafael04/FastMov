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
      appBar: AppBar(
        title: AppText(
          text: 'Ajuda',
          style: AppTextStyleType.bodyLarge,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
    );
  }
}