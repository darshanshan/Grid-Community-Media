import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:grid/core/widgets/page_components/page_title.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTitle(
            color: Theme.of(context).colorScheme.primaryContainer,
            icon: Icons.trending_up_rounded,
            title: 'Trending Users',
            description: 'Top Trendsetters: Explore Our Trending Users!'),
        const Gap(25),
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '1',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const Gap(10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg',
                      height: 35,
                      width: 35,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    'Darshan',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const Spacer(),
                  Text(
                    '6.7',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              const Gap(10),
              Divider(
                color: Theme.of(context).colorScheme.outline,
                thickness: 1,
              )
            ],
          ),
        )
      ],
    );
  }
}
