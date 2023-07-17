import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final IconData? icon;
  final FocusNode? focusNode;
  bool obscureText;

  AppTextField({
    Key? key,
    required this.controller,
    this.label = '',
    this.icon,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: widget.obscureText,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          suffixIcon: widget.keyboardType == TextInputType.visiblePassword
              ? IconButton(
                  icon: Icon(widget.obscureText
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                )
              : null,
          label: Padding(
            padding: EdgeInsets.only(left: widget.icon != null ? 0.0 : 8.0),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
