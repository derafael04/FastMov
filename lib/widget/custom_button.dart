import 'package:flutter/material.dart';

enum ButtonType {
  primary,
  outline,
  disabledLight,
  iconPrimary,
  white,
  outlineDisabled,
}

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonType type;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.label,
    required this.type,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = type == ButtonType.disabledLight || type == ButtonType.outlineDisabled;

    Color backgroundColor;
    Color textColor;
    Color borderColor;
    Widget childContent;

    switch (type) {
      case ButtonType.primary:
        backgroundColor = Theme.of(context).primaryColor;
        textColor = Colors.white;
        borderColor = Colors.transparent;
        break;
      case ButtonType.outline:
        backgroundColor = Colors.transparent;
        textColor = Theme.of(context).primaryColor;
        borderColor = Theme.of(context).primaryColor;
        break;
      case ButtonType.disabledLight:
        backgroundColor = Colors.grey.shade300;
        textColor = Colors.grey;
        borderColor = Colors.transparent;
        break;
      case ButtonType.iconPrimary:
        backgroundColor = Theme.of(context).primaryColor;
        textColor = Colors.white;
        borderColor = Colors.transparent;
        break;
      case ButtonType.white:
        backgroundColor = Colors.white;
        textColor = Theme.of(context).primaryColor;
        borderColor = Colors.transparent;
        break;
      case ButtonType.outlineDisabled:
        backgroundColor = Colors.transparent;
        textColor = Colors.grey;
        borderColor = Colors.grey;
        break;
    }

    childContent = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, color: textColor),
          const SizedBox(width: 8),
        ],
        Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
      ],
    );

    return Opacity(
      opacity: isDisabled ? 0.6 : 1.0,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: borderColor),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          elevation: 0,
        ),
        child: childContent,
      ),
    );
  }
}
