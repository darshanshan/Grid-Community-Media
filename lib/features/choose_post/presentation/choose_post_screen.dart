import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:grid/core/widgets/appBar/primary_app_bar.dart';
import 'package:grid/core/widgets/drawer/drawer.dart';
import 'package:grid/features/create_posts/common_post/presentation/common_post_screen.dart';
import 'package:grid/features/create_posts/create_event/presentation/create_event.dart';
import 'package:grid/features/create_posts/post_layout/post_layout_screen.dart';
import 'package:grid/features/create_posts/text_post/presentation/text_post_screen.dart';

class ChoosePost extends StatelessWidget {
  const ChoosePost({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final Widget divider = Divider(
      color: Theme.of(context).colorScheme.outline,
      thickness: 1,
    );

    Widget optionTile(
        {required String postLabel,
        required IconData icon,
        required onPressed}) {
      return InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 50,
          child: Row(
            children: [
              Icon(
                icon,
                size: 18,
              ),
              const Gap(20),
              Text(
                postLabel,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              Icon(
                Icons.chevron_right_rounded,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarWidget(scaffoldKey: scaffoldKey),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.outline),
              color: Theme.of(context).colorScheme.secondary,
            ),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.chevron_left,
                        size: 24,
                      ),
                    ),
                    const Gap(15),
                    Text(
                      'Create a new post',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const Gap(10),
                divider,
                optionTile(
                    postLabel: 'Common Post',
                    icon: Icons.post_add_rounded,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostLayout(
                              postScreen: CommonPost(),
                            ),
                          ));
                    }),
                divider,
                optionTile(
                    postLabel: 'Text Post',
                    icon: Icons.text_fields,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostLayout(
                              postScreen: TextPost(),
                            ),
                          ));
                    }),
                divider,
                optionTile(
                    postLabel: 'Idea',
                    icon: Icons.auto_awesome_outlined,
                    onPressed: () {}),
                divider,
                optionTile(
                    postLabel: 'Event',
                    icon: Icons.addchart,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostLayout(
                              postScreen: CreateEvent(),
                            ),
                          ));
                    }),
                divider,
                optionTile(
                    postLabel: 'Project',
                    icon: Icons.app_shortcut_outlined,
                    onPressed: () {}),
                divider,
                optionTile(
                    postLabel: 'Create Group',
                    icon: Icons.groups_rounded,
                    onPressed: () {}),
                divider,
                optionTile(
                    postLabel: 'Create Contest',
                    icon: Icons.wb_iridescent_outlined,
                    onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
