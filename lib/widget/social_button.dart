import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String icon;

  const SocialButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black54),
      ),
      child: Image.asset(
        icon,
        width: 24,
        height: 24,
      ),
    );
  }
}