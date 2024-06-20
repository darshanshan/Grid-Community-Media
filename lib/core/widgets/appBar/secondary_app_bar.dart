import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SecondaryAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const SecondaryAppBarWidget({
    super.key,
  });

  //final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(15, 8, 0, 8),
        child: SizedBox(
            height: 35,
            width: 35,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_left),
            )),
      ),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_outlined),
            ),
            const Gap(5),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
            const Gap(5),
            IconButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.primaryContainer,
              )),
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            const Gap(15),
          ],
        )
      ],
    );
  }
}
