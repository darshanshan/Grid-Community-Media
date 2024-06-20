import 'package:flutter/material.dart';

class TertiaryAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const TertiaryAppBarWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.clear_rounded)),
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
