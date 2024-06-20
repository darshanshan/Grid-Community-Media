import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.errorLabel,
  });

  final String hintText;

  final TextEditingController controller;
  final String errorLabel;

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter ${widget.errorLabel} value';
        }
        return null;
      },
      controller: widget.controller,
      obscureText: !showPassword,
      style: GoogleFonts.roboto(
          textStyle: const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        decorationThickness: 0,
      )),
      cursorColor: Theme.of(context).colorScheme.primaryContainer,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () => setState(() {
            showPassword = !showPassword;
          }),
          child: Icon(
            showPassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Theme.of(context).colorScheme.onBackground,
            size: 16,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.labelMedium,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primaryContainer, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline, width: 1),
        ),
      ),
    );
  }
}
