import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:fastmov/widget/card_anuncio.dart';
import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TelaAssinatura extends StatefulWidget {
  const TelaAssinatura({super.key});

  @override
  State<TelaAssinatura> createState() => _TelaAssinaturaState();
}

class _TelaAssinaturaState extends State<TelaAssinatura> {
  bool isActiveTab = true;
  SegmentType isSelected = SegmentType.news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Assinatura',
        actions: IconButton(
          icon: const HeroIcon(HeroIcons.informationCircle),
          onPressed: () {
            Navigator.of(context).pushNamed('/telaAjuda');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        child: Column(
          children: [
            CustomSlidingSegmentedControl<SegmentType>(
            initialValue: SegmentType.news,
            isStretch: true,
            children: {
              SegmentType.news: AppText(text: 'Assinatura ativa', style: AppTextStyleType.bodyStrong, color: isSelected != SegmentType.news ? const Color(0xff9E9E9E) : null),
              SegmentType.active: AppText(text: 'Nova assinatura', style: AppTextStyleType.bodyStrong, color: isSelected != SegmentType.active ? const Color(0xff9E9E9E) : null),
            },
            innerPadding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xffD2D2D2),
              borderRadius: BorderRadius.circular(14),
            ),
            thumbDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            onValueChanged: (v) {
              setState(() {
                isSelected = v;
              });
            },
            ),
            const SizedBox(height: 24),
            if (isSelected == SegmentType.news)
              Expanded(
                child: ListView.separated(
                  itemCount: 1,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return const CardAnuncio();
                  },
                ),
              )
            else
              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return const CardAnuncio();
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

enum SegmentType { news, active }