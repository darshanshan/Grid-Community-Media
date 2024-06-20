import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:grid/core/widgets/page_components/tags_card.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    final tags = ['Man', 'Tree', 'Target'];
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.network(
              'https://gratisography.com/wp-content/uploads/2024/01/gratisography-cyber-kitty-800x525.jpg',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contest Name',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Gap(10),
                Text(
                  'A Short Contest Description',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const Gap(5),
                Text(
                  'Contest large Description',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        direction: Axis.horizontal,
                        children:
                            tags.map((e) => TagsCard(tagName: e)).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
