import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grid/core/widgets/button/post_action_button.dart';
import 'package:grid/features/post_card/presentation/widgets/post_catagory_card.dart';
import 'package:grid/features/post_card/presentation/widgets/tag_card.dart';
import 'package:grid/model/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.document});

  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    //Post Document
    final doc = PostModel.fromMap(document.data() as Map<String, dynamic>);
    print(doc.postTitle);

    //ThemeData
    final TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall;
    final TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;
    final ColorScheme colors = Theme.of(context).colorScheme;

    //Like Button
    Widget likeButton(String likeType) {
      return Text(
        likeType,
        style: const TextStyle(fontSize: 14),
      );
    }

    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: Theme.of(context).colorScheme.outline),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        PostCatagoryCard(
                          buttonColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          catagoryIcon: Icons.newspaper_rounded,
                          catagoryName: 'Announcement',
                        ),
                        PostCatagoryCard(
                          buttonColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          catagoryIcon: Icons.account_balance_wallet,
                          catagoryName: 'Project',
                        ),
                        PostCatagoryCard(
                          buttonColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          catagoryIcon: Icons.auto_awesome_outlined,
                          catagoryName: 'Idea',
                        ),
                      ],
                    ),
                    const Gap(16),
                    const TagCard(tagLabel: '8/9/2020'),
                    const Gap(16),
                    Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/10337/10337609.png',
                              fit: BoxFit.cover,
                              height: 35,
                              width: 35,
                            )),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Darshan',
                              style: displaySmall,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: 'a moment ago',
                                  style: titleSmall,
                                  children: const [
                                    TextSpan(text: ' · '),
                                    TextSpan(text: 'Posted in '),
                                    TextSpan(text: 'Announcements'),
                                  ]),
                            ),
                            Text(
                              'just now',
                              style: titleSmall,
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                    const Gap(16),
                    Text(
                      doc.postTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Gap(10),
                    Text(
                      doc.postDescription,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.background),
                      child: Row(
                        children: [
                          Text(
                            'Link : ',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            'https://www.google.com/',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(16),
                    const Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: [
                        TagCard(
                          tagLabel: 'Tag No.1',
                        ),
                        TagCard(tagLabel: 'Again Card')
                      ],
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: colors.onPrimaryContainer,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              likeButton('👍'),
                              const Gap(5),
                              likeButton('💓'),
                              const Gap(5),
                              likeButton('🎉'),
                            ],
                          ),
                        ),
                        const Gap(10),
                        Text(
                          '1.2k Likes',
                          style: displaySmall,
                        ),
                        const Spacer(),
                        Text(
                          '35 Comments',
                          style: displaySmall,
                        ),
                      ],
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        Expanded(
                          child: PostActionButton(
                              childWidget: likeButton('💓'), onTap: () {}),
                        ),
                        const Gap(20),
                        Expanded(
                          child: PostActionButton(
                              childWidget: Icon(
                                Icons.mode_comment_outlined,
                                color: colors.onBackground,
                                size: 14,
                              ),
                              onTap: () {}),
                        ),
                        const Gap(20),
                        Expanded(
                          child: PostActionButton(
                              childWidget: Icon(
                                Icons.near_me_outlined,
                                color: colors.onBackground,
                                size: 14,
                              ),
                              onTap: () {}),
                        ),
                      ],
                    ),
                    const Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
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
                        const Gap(20),
                        Expanded(
                          child: Container(
                            height: 35,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: colors.onPrimaryContainer,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                'What are your thoughts?',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ),
                        ),
                        const Gap(20),
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: IconButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.primaryContainer,
                            )),
                            onPressed: () {},
                            icon: const Icon(Icons.send_outlined),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
