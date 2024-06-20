import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.hintText = '',
    this.keyboard = TextInputType.text,
    this.maxLines = 1,
    this.minLines,
    this.validator,
  });

  final String hintText;

  final TextEditingController controller;
  final TextInputType keyboard;

  final int? minLines;
  final int maxLines;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      // (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please Enter $errorLabel value';
      //   }
      //   // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      //   //             return 'Please enter a valid email address';
      //   //           }
      //   return null;
      // },
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboard,
      style: GoogleFonts.roboto(
          textStyle: const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        decorationThickness: 0,
      )),
      cursorColor: Theme.of(context).colorScheme.primaryContainer,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        hintText: hintText,
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
