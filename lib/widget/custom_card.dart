import 'package:flutter/material.dart';

enum CardType { primary, secondary }

class CustomCard extends StatelessWidget {
  final CardType type;
  final Widget body;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final BoxBorder? border;

  const CustomCard({
    super.key,
    required this.type,
    required this.body,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.all(8),
    this.borderRadius = 16,
    this.border,
  });

  Color _getBackgroundColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    switch (type) {
      case CardType.primary:
        return isDark ? const Color(0xFF2C2C2C) : const Color(0xFFFFFFFF);
      case CardType.secondary:
        return isDark ? const Color(0xFF424242) : const Color(0xFF9E9E9E);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: body,
    );
  }
}