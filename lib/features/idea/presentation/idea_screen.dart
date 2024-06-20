import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:grid/core/widgets/page_components/page_title.dart';
import 'package:grid/core/widgets/page_components/project_card.dart';

import 'package:grid/core/widgets/page_components/section_title_with_button.dart';

class IdeaScreen extends StatelessWidget {
  const IdeaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageTitle(
          color: Theme.of(context).colorScheme.secondaryContainer,
          icon: Icons.auto_awesome_outlined,
          title: 'Ideas',
          description: 'Unveil Brilliance: Dive into Your Ideas Hub!',
        ),
        const Gap(26),
        const SectionTitleWithButton(sectionTitle: 'Community Ideas'),
        const Gap(16),
        const Projectcard(),
        const Gap(20),
        const SectionTitleWithButton(sectionTitle: 'My Ideas'),
        const Gap(16),
        const Projectcard(),
        const Gap(20),
      ],
    );
  }
}
