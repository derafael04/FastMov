import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Enum para os tipos de texto
enum CustomTextStyleType {
  display1,
  display2,
  display3,
  title1,
  title2,
  headline,
  subheadline,
  body,
  bodyStrong,
  caption1,
}

class CustomTextUtil {
  static Color _getColor(bool ePrimario, [BuildContext? context]) {
    // Usa o tema do contexto atual em vez da variável estática
    final brightness = context != null
        ? Theme.of(context).brightness
        : Brightness.light;

    final isLight = brightness == Brightness.light;

    if (isLight) {
      return ePrimario ? const Color(0xff2f2f2f) : const Color(0xff555555);
    } else {
      return ePrimario ? const Color(0xffF5F5F5) : const Color(0xffB3B3B3);
    }
  }

  static TextStyle styleDisplay1({required bool isHeavy, BuildContext? context, Color? color}) =>
      GoogleFonts.dmSans(
        fontSize: 48,
        fontWeight: isHeavy ? FontWeight.w700 : FontWeight.w600,
        color: color ?? _getColor(isHeavy, context),
      );
  static TextStyle styleDisplay2({required bool isHeavy, BuildContext? context, Color? color}) =>
      GoogleFonts.dmSans(
        fontSize: 40,
        fontWeight: isHeavy ? FontWeight.w700 : FontWeight.w500,
        color: color ?? _getColor(isHeavy, context),
      );
  static TextStyle styleDisplay3({required bool isHeavy, BuildContext? context, Color? color}) =>
      GoogleFonts.dmSans(
        fontSize: 32,
        fontWeight: isHeavy ? FontWeight.w600 : FontWeight.w500,
        color: color ?? _getColor(isHeavy, context),
      );
  static TextStyle styleTitle1({required bool isHeavy, BuildContext? context, Color? color}) =>
      GoogleFonts.dmSans(
        fontSize: 24,
        fontWeight: isHeavy ? FontWeight.w700 : FontWeight.w400,
        color: color ?? _getColor(isHeavy, context),
      );
  static TextStyle styleTitle2({required bool isHeavy, BuildContext? context, Color? color}) =>
      GoogleFonts.dmSans(
        fontSize: 20,
        fontWeight: isHeavy ? FontWeight.w700 : FontWeight.w400,
        color: color ?? _getColor(isHeavy, context),
      );
  static TextStyle styleHeadline({required bool isHeavy, BuildContext? context, Color? color}) =>
      GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: isHeavy ? FontWeight.w600 : FontWeight.w400,
        color: color ?? _getColor(isHeavy, context),
      );
  static TextStyle styleSubheadline({required bool isHeavy, BuildContext? context, Color? color}) =>
      GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: isHeavy ? FontWeight.w600 : FontWeight.w400,
        color: color ?? _getColor(isHeavy, context),
      );
  static TextStyle styleBody({required bool isHeavy, BuildContext? context, Color? color}) =>
      GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: isHeavy ? FontWeight.w700 : FontWeight.w400,
        color: color ?? _getColor(isHeavy, context),
      );
  static TextStyle styleBodyStrong({required bool isHeavy, BuildContext? context, Color? color}) =>
      GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: isHeavy ? FontWeight.w600 : FontWeight.w400,
        color: color ?? _getColor(isHeavy, context),
      );
  static TextStyle styleCaption1({required bool isHeavy, BuildContext? context, Color? color}) =>
      GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: isHeavy ? FontWeight.w600 : FontWeight.w400,
        color: color ?? _getColor(isHeavy, context),
      );
}

abstract class BaseCustomTextBuild extends StatelessWidget {
  final String? data;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final Color? color;
  final int? maxLines;
  final bool? isHeavy;

  const BaseCustomTextBuild(
    this.data,
    this.textAlign,
    this.overflow,
    this.color,
    this.maxLines,
    this.isHeavy,
    {super.key}
  );

  TextStyle resolveTextStyle(TextStyle Function({required bool isHeavy, BuildContext? context, Color? color}) styleFn, BuildContext context) {
    return styleFn(isHeavy: isHeavy ?? true, context: context, color: color);
  }

  Widget buildText(BuildContext context, {required TextStyle defaultTextStyle}) {
    return Text(
      data ?? '',
      style: defaultTextStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

class CustomTextDisplay1 extends BaseCustomTextBuild {
  const CustomTextDisplay1(
    String data, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    int? maxLines,
    bool? isHeavy = true,
    Key? key,
  }) : super(data, textAlign, overflow, color, maxLines, isHeavy, key: key);

  @override
  Widget build(BuildContext context) {
    return buildText(context, defaultTextStyle: resolveTextStyle(CustomTextUtil.styleDisplay1, context));
  }
}

class CustomTextDisplay2 extends BaseCustomTextBuild {
  const CustomTextDisplay2(
    String data, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    int? maxLines,
    bool? isHeavy = true,
    Key? key,
  }) : super(data, textAlign, overflow, color, maxLines, isHeavy, key: key);

  @override
  Widget build(BuildContext context) {
    return buildText(context, defaultTextStyle: resolveTextStyle(CustomTextUtil.styleDisplay2, context));
  }
}

class CustomTextDisplay3 extends BaseCustomTextBuild {
  const CustomTextDisplay3(
    String data, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    int? maxLines,
    bool? isHeavy = true,
    Key? key,
  }) : super(data, textAlign, overflow, color, maxLines, isHeavy, key: key);

  @override
  Widget build(BuildContext context) {
    return buildText(context, defaultTextStyle: resolveTextStyle(CustomTextUtil.styleDisplay3, context));
  }
}

class CustomTextTitle1 extends BaseCustomTextBuild {
  const CustomTextTitle1(
    String data, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    int? maxLines,
    bool? isHeavy = true,
    Key? key,
  }) : super(data, textAlign, overflow, color, maxLines, isHeavy, key: key);

  @override
  Widget build(BuildContext context) {
    return buildText(context, defaultTextStyle: resolveTextStyle(CustomTextUtil.styleTitle1, context));
  }
}

class CustomTextTitle2 extends BaseCustomTextBuild {
  const CustomTextTitle2(
    String data, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    int? maxLines,
    bool? isHeavy = true,
    Key? key,
  }) : super(data, textAlign, overflow, color, maxLines, isHeavy, key: key);

  @override
  Widget build(BuildContext context) {
    return buildText(context, defaultTextStyle: resolveTextStyle(CustomTextUtil.styleTitle2, context));
  }
}

class CustomTextHeadline extends BaseCustomTextBuild {
  const CustomTextHeadline(
    String data, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    int? maxLines,
    bool? isHeavy = true,
    Key? key,
  }) : super(data, textAlign, overflow, color, maxLines, isHeavy, key: key);

  @override
  Widget build(BuildContext context) {
    return buildText(context, defaultTextStyle: resolveTextStyle(CustomTextUtil.styleHeadline, context));
  }
}

class CustomTextSubheadline extends BaseCustomTextBuild {
  const CustomTextSubheadline(
    String data, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    int? maxLines,
    bool? isHeavy = true,
    Key? key,
  }) : super(data, textAlign, overflow, color, maxLines, isHeavy, key: key);

  @override
  Widget build(BuildContext context) {
    return buildText(context, defaultTextStyle: resolveTextStyle(CustomTextUtil.styleSubheadline, context));
  }
}

class CustomTextBody extends BaseCustomTextBuild {
  const CustomTextBody(
    String data, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    int? maxLines,
    bool? isHeavy = false,
    Key? key,
  }) : super(data, textAlign, overflow, color, maxLines, isHeavy, key: key);

  @override
  Widget build(BuildContext context) {
    return buildText(context, defaultTextStyle: resolveTextStyle(CustomTextUtil.styleBody, context));
  }
}

class CustomTextBodyStrong extends BaseCustomTextBuild {
  const CustomTextBodyStrong(
    String data, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    int? maxLines,
    bool? isHeavy = true,
    Key? key,
  }) : super(data, textAlign, overflow, color, maxLines, isHeavy, key: key);

  @override
  Widget build(BuildContext context) {
    return buildText(context, defaultTextStyle: resolveTextStyle(CustomTextUtil.styleBodyStrong, context));
  }
}

class CustomTextCaption1 extends BaseCustomTextBuild {
  const CustomTextCaption1(
    String data, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    int? maxLines,
    bool? isHeavy = false,
    Key? key,
  }) : super(data, textAlign, overflow, color, maxLines, isHeavy, key: key);

  @override
  Widget build(BuildContext context) {
    return buildText(context, defaultTextStyle: resolveTextStyle(CustomTextUtil.styleCaption1, context));
  }
}

class CustomLib {
  static ThemeMode? theme;
  static void setTheme(ThemeMode theme) {
    CustomLib.theme = theme;
  }
}