import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final bool? isPassword;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    this.hintText,
    this.isPassword,
    this.prefixIcon,
    this.controller,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: (widget.isPassword ?? false) ? obscureText : false,
      controller: widget.controller ?? TextEditingController(),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText ?? '',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: (widget.isPassword ?? false)
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
    );
  }
}
