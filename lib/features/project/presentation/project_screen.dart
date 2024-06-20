import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:grid/core/widgets/page_components/page_title.dart';
import 'package:grid/core/widgets/page_components/project_card.dart';

import 'package:grid/core/widgets/page_components/section_title_with_button.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageTitle(
          color: Theme.of(context).colorScheme.secondaryContainer,
          icon: Icons.account_balance_wallet,
          title: 'Projects Showcase',
          description:
              'Turn Ideas into Reality: Welcome to Your Projects Page!',
        ),
        const Gap(26),
        const SectionTitleWithButton(sectionTitle: 'Community Projects'),
        const Gap(16),
        const Projectcard(),
        const Gap(20),
        const SectionTitleWithButton(sectionTitle: 'My Projects'),
        const Gap(16),
        const Projectcard(),
        const Gap(20),
      ],
    );
  }
}
