import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:grid/core/widgets/button/cancel_button.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 170,
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
              height: 70,
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
                  style: Theme.of(context).textTheme.displaySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(10),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
                height: 35,
                child:
                    CancelButton(labelText: 'View Details', onPressed: () {})),
          )
        ],
      ),
    );
  }
}
