import 'package:flutter/material.dart';

class TagsCard extends StatelessWidget {
  const TagsCard({
    super.key,
    required this.tagName,
  });

  final String tagName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.outline,
          ),
          child: Text(
            tagName,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
