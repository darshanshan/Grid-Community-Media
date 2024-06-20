import 'package:flutter/material.dart';

class HeadLineText extends StatelessWidget {
  const HeadLineText({super.key, required this.labelText});

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
