import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    required this.labelText,
    required this.onPressed,
  });

  final String labelText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            side: BorderSide(
                width: 1, color: Theme.of(context).colorScheme.outline),
          ),
          child: Text(labelText)),
    );
  }
}
