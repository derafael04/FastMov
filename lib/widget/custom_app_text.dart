import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTextStyleType {
  display,
  largeTitle,
  title,
  subtitle,
  bodyLarge,
  bodyStrong,
  body,
  caption,
}

class AppText extends StatelessWidget {
  final String text;
  final AppTextStyleType style;
  final TextAlign? textAlign;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? isNotHeavy;

  const AppText({
    super.key,
    required this.text,
    required this.style,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.isNotHeavy,
  });

  TextStyle _getTextStyle(BuildContext context) {
    final defaultColor = Theme.of(context).textTheme.bodyMedium?.color;

    switch (style) {
      case AppTextStyleType.display:
        return GoogleFonts.outfit(
          fontSize: 40,
          fontWeight: (isNotHeavy ?? false) ? FontWeight.w100 : FontWeight.w700,
          color: color ?? defaultColor,
        );
      case AppTextStyleType.largeTitle:
        return GoogleFonts.outfit(
          fontSize: 32,
          fontWeight: (isNotHeavy ?? false) ? FontWeight.w100 : FontWeight.w600,
          color: color ?? defaultColor,
        );
      case AppTextStyleType.title:
        return GoogleFonts.outfit(
          fontSize: 24,
          fontWeight: (isNotHeavy ?? false) ? FontWeight.w100 : FontWeight.w600,
          color: color ?? defaultColor,
        );
      case AppTextStyleType.subtitle:
        return GoogleFonts.outfit(
          fontSize: 20,
          fontWeight: (isNotHeavy ?? false) ? FontWeight.w100 : FontWeight.w600,
          color: color ?? defaultColor,
        );
      case AppTextStyleType.bodyLarge:
        return GoogleFonts.outfit(
          fontSize: 18,
          fontWeight: (isNotHeavy ?? false) ? FontWeight.w100 : FontWeight.w400,
          color: color ?? defaultColor,
        );
      case AppTextStyleType.bodyStrong:
        return GoogleFonts.outfit(
          fontSize: 16,
          fontWeight: (isNotHeavy ?? false) ? FontWeight.w100 : FontWeight.w600,
          color: color ?? defaultColor,
        );
      case AppTextStyleType.body:
        return GoogleFonts.outfit(
          fontSize: 16,
          fontWeight: (isNotHeavy ?? false) ? FontWeight.w100 : FontWeight.w400,
          color: color ?? defaultColor,
        );
      case AppTextStyleType.caption:
        return GoogleFonts.outfit(
          fontSize: 14,
          fontWeight: (isNotHeavy ?? false) ? FontWeight.w100 : FontWeight.w400,
          color: color ?? defaultColor,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getTextStyle(context),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}