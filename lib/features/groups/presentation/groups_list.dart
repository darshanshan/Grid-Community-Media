import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grid/core/widgets/page_components/group_item_card.dart';
import 'package:grid/core/widgets/page_components/page_title.dart';

import 'package:grid/core/widgets/page_components/section_title_with_button.dart';

class GroupsList extends StatelessWidget {
  const GroupsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageTitle(
          color: Theme.of(context).colorScheme.primaryContainer,
          icon: Icons.add_chart,
          title: 'Groups',
          description:
              'Group Gatherings: Connect with Like-minded Individuals!',
        ),
        const Gap(26),
        const SectionTitleWithButton(sectionTitle: 'All Groups'),
        const Gap(16),
        const GroupCard(),
        const Gap(20),
        const SectionTitleWithButton(sectionTitle: 'Groups Joined'),
        const Gap(16),
        const GroupCard(),
        const Gap(20),
        const SectionTitleWithButton(sectionTitle: 'My Groups'),
        const Gap(16),
        const GroupCard(),
        const Gap(20),
      ],
    );
  }
}
