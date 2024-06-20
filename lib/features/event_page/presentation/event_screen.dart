import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:grid/core/widgets/page_components/event_card.dart';

import 'package:grid/core/widgets/page_components/page_title.dart';
import 'package:grid/core/widgets/page_components/section_title.dart';
import 'package:grid/features/event_page/presentation/event_details.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTitle(
          color: Theme.of(context).colorScheme.primaryContainer,
          icon: Icons.add_chart,
          title: 'Events',
          description: 'Mark Your Calendar: Discover the Latest Events!',
        ),
        const Gap(16),
        const SectionTitle(sectionTitle: 'Upcoming Events'),
        const Gap(16),
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Eventdetails(),
              )),
          child: const EventCard(),
        )
      ],
    );
  }
}
