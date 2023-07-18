import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final IconData? icon;
  final FocusNode? focusNode;
  bool obscureText;
  final bool enabled;

  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;

  AppTextField({
    super.key,
    required this.controller,
    this.label = '',
    this.icon,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.obscureText = false,
    this.maxLength,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.enabled = true,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        enabled: widget.enabled,
        validator: widget.validator,
        maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatters,
        obscureText: widget.obscureText,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
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
