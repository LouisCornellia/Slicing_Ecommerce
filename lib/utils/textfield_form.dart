import 'package:flutter/material.dart';
import 'package:slicing_application/utils/font.dart';

class TextfieldForm extends StatefulWidget {
  final String label;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;

  const TextfieldForm({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.onChange,
  });

  @override
  State<TextfieldForm> createState() => _TextfieldFormState();
}

class _TextfieldFormState extends State<TextfieldForm> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && _obsecureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChange,
      style: Fonts.withColor(
        Fonts.bodyMedium,
        Theme.of(context).textTheme.bodyLarge!.color!,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: Fonts.withColor(
          Fonts.bodyMedium,
          isDark ? Colors.grey.shade300 : Colors.grey.shade600,
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: isDark ? Colors.grey.shade300 : Colors.grey.shade500,
        ),
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obsecureText = !_obsecureText;
                    });
                  },
                  icon: Icon(
                    _obsecureText ? Icons.visibility_off : Icons.visibility,
                  ),
                )
                : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey.shade300 : Colors.grey.shade500,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey.shade300 : Colors.grey.shade500,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}
