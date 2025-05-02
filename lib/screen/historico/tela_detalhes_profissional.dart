import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaDetalhesProfissional extends StatelessWidget {
  const TelaDetalhesProfissional({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Detalhes do Profissional',
      ),
      body: const SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto e nome
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/userProfissional.png'), // substitua pela sua imagem
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Márcio André',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'CREFITO: 02148/245',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeroIcon(HeroIcons.mapPin, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text('1.2 Km', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              // Sobre
              Text(
                'Sobre',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text...',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 24),

              // Formação
              Text(
                'Formação',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Fisioterapia – Universidade Federal de Goiás',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 24),

              // Experiência
              Text(
                'Experiência',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ExperienceItem(text: 'Fisioterapeuta do time de futebol XV de Piracicaba por 5 anos'),
              ExperienceItem(text: 'Experiência em acompanhamento de atletas durante treinamentos e competições'),
              ExperienceItem(text: 'Participação em eventos esportivos nacionais e internacionais'),
              SizedBox(height: 24),

              // Especialização
              Text(
                'Especialização',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  SpecializationChip(label: 'Liberação'),
                  SpecializationChip(label: 'Mobilização articular'),
                  SpecializationChip(label: 'Eletroterapia'),
                  SpecializationChip(label: 'Exercícios terapêuticos'),
                  SpecializationChip(label: 'Técnicas de reeducação postural'),
                ],
              ),
            ],
          ),
        ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String text;

  const ExperienceItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeroIcon(HeroIcons.checkCircle, color: Colors.black, size: 20),
        const SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }
}

class SpecializationChip extends StatelessWidget {
  final String label;

  const SpecializationChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        //color: const Color(0xFFF2F2F2),
        border: Border.all(color: const Color(0xFF6E6E6E)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 13),
      ),
    );
  }
}