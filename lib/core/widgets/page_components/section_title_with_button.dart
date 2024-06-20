import 'package:flutter/material.dart';

import 'package:grid/core/widgets/button/small_main_button.dart';

class SectionTitleWithButton extends StatelessWidget {
  const SectionTitleWithButton({super.key, required this.sectionTitle});
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            sectionTitle,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Spacer(),
          SizedBox(
              height: 30,
              child: SmallMainButton(
                  labelText: 'ViewAll', onPressed: () {}, isLoading: false)),
        ],
      ),
    );
  }
}
