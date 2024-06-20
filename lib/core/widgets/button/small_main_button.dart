import 'package:flutter/material.dart';
import 'package:grid/core/widgets/loading_indicator/button_loading.dart';

class SmallMainButton extends StatelessWidget {
  const SmallMainButton({
    super.key,
    required this.labelText,
    required this.onPressed,
    required this.isLoading,
  });

  final String labelText;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            padding: const EdgeInsets.symmetric(horizontal: 15),
          ),
          child: isLoading
              ? const SizedBox(height: 20, width: 20, child: ButtonLoading())
              : Text(labelText)),
    );
  }
}
