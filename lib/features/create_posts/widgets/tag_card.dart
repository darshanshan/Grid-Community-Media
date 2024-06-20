import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TagCardWidget extends StatelessWidget {
  const TagCardWidget(
      {super.key, required this.tagName, required this.onPressed});

  final String tagName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.outline,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tagName,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Gap(5),
            GestureDetector(
              onTap: onPressed,
              child: const Icon(
                Icons.clear_rounded,
                size: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
