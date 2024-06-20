import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grid/core/widgets/appBar/secondary_app_bar.dart';

class AuthUserScreen extends StatelessWidget {
  const AuthUserScreen({super.key});
  final String imageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV6-DQF2pBwNFV9KzPafu9RghrNF1tZ8J3AA&s';

  @override
  Widget build(BuildContext context) {
    Widget selectIndicators() {
      return Expanded(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: const BeveledRectangleBorder(),
                  ),
                  child: Text(
                    'Posts',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: Theme.of(context).colorScheme.primaryContainer,
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: const SecondaryAppBarWidget(),
      body: ListView(
        children: [
          Container(
            color: Theme.of(context).colorScheme.secondary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Column(
                          children: [
                            Image.network(
                              imageUrl,
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            const Gap(50),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                //color: Colors.blue,
                                border:
                                    Border.all(width: 3, color: Colors.red)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                imageUrl,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0x2BFFFFFF),
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.photo_camera_outlined)),
                        ],
                      ),
                    )
                  ],
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Gap(5),
                      Text(
                        'Tagline',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Gap(5),
                      Row(
                        children: [
                          Text('Website',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                fontSize: 12,
                              ))),
                          const Gap(5),
                          Icon(
                            Icons.open_in_new_rounded,
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            size: 10,
                          )
                        ],
                      ),
                      const Gap(5),
                      Text(
                        'Blaze Points',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.keyboard_control_rounded)),
                          const Gap(10),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.edit_outlined),
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                  color: Theme.of(context).colorScheme.outline,
                                  width: 1),
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            label: const Text('Edit Profile'),
                          ),
                        ],
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    selectIndicators(),
                    selectIndicators(),
                    selectIndicators(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
