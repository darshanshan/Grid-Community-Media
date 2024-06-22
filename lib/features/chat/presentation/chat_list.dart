import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grid/core/widgets/appBar/primary_app_bar.dart';
import 'package:grid/core/widgets/drawer/drawer.dart';

import 'package:grid/core/widgets/page_components/user_section.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: AppBarWidget(scaffoldKey: scaffoldKey),
        body: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
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
                          'Messages',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        const Icon(Icons.mode_edit_outlined),
                      ],
                    ),
                    const Gap(20),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        // controller: controller,

                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          decorationThickness: 0,
                        )),
                        cursorColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.background,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 10,
                          ),
                          hintText: 'Search...',
                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            size: 16,
                          ),
                          suffixIcon: const Icon(
                            Icons.clear_rounded,
                            size: 16,
                          ),
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                                width: 1),
                          ),
                        ),
                      ),
                    ),
                    const Gap(25),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const UserSection(),
                            Text(
                              '10 mins',
                              style: Theme.of(context).textTheme.titleSmall,
                            )
                          ],
                        ),
                      ],
                    ),
                    const Gap(15),
                    Divider(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      height: 1,
                    )
                  ],
                ))),
      ),
    );
  }
}
