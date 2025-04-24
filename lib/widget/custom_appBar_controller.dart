import 'package:fastmov/widget/custom_app_text.dart';
import 'package:flutter/material.dart';

class CadastroAppBarComControle extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final PageController controller;
  final int totalSteps;
  final VoidCallback? onBack;
  final VoidCallback? onInfoTap;

  const CadastroAppBarComControle({
    super.key,
    required this.title,
    required this.controller,
    required this.totalSteps,
    this.onBack,
    this.onInfoTap,
  });

  @override
  State<CadastroAppBarComControle> createState() => _CadastroAppBarComControleState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);
}

class _CadastroAppBarComControleState extends State<CadastroAppBarComControle> {
  late double currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = widget.controller.initialPage.toDouble();
    widget.controller.addListener(_updatePage);
  }

  void _updatePage() {
    final newPage = widget.controller.page ?? widget.controller.initialPage.toDouble();
    if (newPage != currentPage) {
      setState(() {
        currentPage = newPage;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updatePage);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? Colors.white : const Color(0xFF000222);
    final backgroundColor = isDark ? Colors.black : const Color(0xffF1F1F1);
    final progressBackground = isDark ? Colors.white12 : const Color(0xFFE9E8EE);

    return SafeArea(
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (widget.onBack != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: widget.onBack,
                        color: primaryColor,
                      ),
                    ),
                  AppText(
                    text: widget.title,
                    style: AppTextStyleType.bodyLarge,
                    color: primaryColor,
                  ),
                  if (widget.onInfoTap != null)
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.info_outline),
                        onPressed: widget.onInfoTap,
                        color: primaryColor,
                      ),
                    ),
                ],
              ),
            ),
            LinearProgressIndicator(
              value: (currentPage + 1) / widget.totalSteps,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              backgroundColor: progressBackground,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  const CustomAppBar({
    required this.title,
    super.key, this.leading
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? Colors.white : const Color(0xFF000222);
    final backgroundColor = isDark ? Colors.black : const Color(0xffF1F1F1);
    return SafeArea(
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_rounded),
                      onPressed: () => Navigator.pop(context),
                      color: primaryColor,
                    ),
                  ),
                  AppText(
                    text: widget.title,
                    style: AppTextStyleType.bodyLarge,
                    color: primaryColor,
                  ),
                  if (widget.leading != null)
                    Align(
                      alignment: Alignment.centerRight,
                      child: widget.leading,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
