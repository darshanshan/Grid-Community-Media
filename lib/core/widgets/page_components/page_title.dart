import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.description,
  });
  final Color color;
  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
          child: Icon(icon),
        ),
        const Gap(15),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}
