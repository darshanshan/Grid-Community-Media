import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:grid/features/chat/presentation/chat_list.dart';
import 'package:grid/features/choose_post/presentation/choose_post_screen.dart';
import 'package:grid/features/user_profile/presentation/auth_user_screen.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          scaffoldKey.currentState?.openDrawer();
        },
        child: const Icon(
          Icons.calendar_view_day_sharp,
          size: 28,
        ),
      ),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatList(),
                    ));
              },
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChoosePost(),
                    ));
              },
              icon: const Icon(Icons.add),
            ),
            const Gap(5),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthUserScreen(),
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 35,
                  width: 35,
                  color: Colors.black,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    height: 35,
                    width: 35,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Gap(15),
          ],
        )
      ],
    );
  }
}
