import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grid/features/authentication/domain/services/auth_services.dart';
import 'package:grid/features/event_page/presentation/event_screen.dart';
import 'package:grid/features/groups/presentation/groups_list.dart';
import 'package:grid/features/home/presentation/home_feed_screen.dart';
import 'package:grid/features/idea/presentation/idea_screen.dart';
import 'package:grid/features/pageLayout/main_page_layout.dart';
import 'package:grid/features/project/presentation/project_screen.dart';
import 'package:grid/features/trending/presentation/trending_screen.dart';
import 'package:grid/features/user_profile/presentation/auth_user_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color purple = Theme.of(context).colorScheme.primaryContainer;
    final Color green = Theme.of(context).colorScheme.secondaryContainer;
    final Color orange = Theme.of(context).colorScheme.tertiaryContainer;

    Widget starterMenu(
      IconData icon,
      String label,
      VoidCallback onTap,
    ) {
      return GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                const Gap(15),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const Gap(15),
          ],
        ),
      );
    }

    Widget mainMenu({
      required IconData icon,
      required String label,
      required Color color,
      required VoidCallback onTap,
    }) {
      return GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              SizedBox(
                height: 30,
                width: 30,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(icon),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(color)),
                ),
              ),
              const Gap(15),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ]),
            const Gap(15),
          ],
        ),
      );
    }

    Widget footerText(String text) {
      return Text(
        text,
        style: Theme.of(context).textTheme.bodySmall,
      );
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            starterMenu(
              Icons.other_houses_outlined,
              'Home',
              () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeFeed(),
                  ),
                );
              },
            ),
            starterMenu(
              Icons.person_outlined,
              'Profile',
              () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthUserScreen(),
                  ),
                );
              },
            ),
            const Gap(20),
            Text(
              'Community',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Gap(20),
            mainMenu(
              icon: Icons.newspaper_rounded,
              label: 'Announcements',
              color: purple,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            mainMenu(
              icon: Icons.trending_up_rounded,
              label: 'Trending',
              color: purple,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPageLayout(
                      postScreen: TrendingScreen(),
                    ),
                  ),
                );
              },
            ),
            mainMenu(
              icon: Icons.addchart,
              label: 'Events',
              color: purple,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPageLayout(
                      postScreen: EventPage(),
                    ),
                  ),
                );
              },
            ),
            mainMenu(
              icon: Icons.padding_rounded,
              label: 'Clubs',
              color: purple,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            mainMenu(
              icon: Icons.group_sharp,
              label: 'Groups',
              color: purple,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPageLayout(
                      postScreen: GroupsList(),
                    ),
                  ),
                );
              },
            ),
            const Gap(20),
            Text(
              'Innovation',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Gap(20),
            mainMenu(
              icon: Icons.favorite_border_outlined,
              label: 'Wishlist',
              color: green,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            mainMenu(
              icon: Icons.account_balance_wallet,
              label: 'Projects',
              color: green,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPageLayout(
                      postScreen: ProjectScreen(),
                    ),
                  ),
                );
              },
            ),
            mainMenu(
              icon: Icons.auto_awesome_outlined,
              label: 'Ideas',
              color: green,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPageLayout(
                      postScreen: IdeaScreen(),
                    ),
                  ),
                );
              },
            ),
            mainMenu(
              icon: Icons.wb_iridescent_outlined,
              label: 'Contests',
              color: orange,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            mainMenu(
              icon: Icons.settings_rounded,
              label: 'Settings',
              color: orange,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Gap(20),
            GestureDetector(
              onTap: () {
                AuthServices().signOut();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  footerText('Terms · Privacy · © Copyright 2023'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
