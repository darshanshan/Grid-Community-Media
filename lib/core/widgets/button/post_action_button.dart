import 'package:flutter/material.dart';

class PostActionButton extends StatelessWidget {
  const PostActionButton(
      {super.key, required this.childWidget, required this.onTap});

  final VoidCallback onTap;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
              width: 1,
            ),
          ),
          onPressed: onTap,
          child: childWidget),
    );
  }
}
