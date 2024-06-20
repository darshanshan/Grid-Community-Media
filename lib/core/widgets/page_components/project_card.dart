import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:grid/core/widgets/page_components/profile_image.dart';
import 'package:grid/core/widgets/page_components/user_section.dart';

class Projectcard extends StatelessWidget {
  const Projectcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 220,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
        border:
            Border.all(color: Theme.of(context).colorScheme.outline, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.network(
              'https://gratisography.com/wp-content/uploads/2024/01/gratisography-cyber-kitty-800x525.jpg',
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(19),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(10),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: UserSection(),
          )
        ],
      ),
    );
  }
}
