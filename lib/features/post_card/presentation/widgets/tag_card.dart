import 'package:flutter/material.dart';

class TagCard extends StatelessWidget {
  const TagCard({super.key, required this.tagLabel});
  final String tagLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      child: Text('8/9/2020', style: Theme.of(context).textTheme.displaySmall),
    );
  }
}
