import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grid/core/widgets/button/post_action_button.dart';
import 'package:grid/domain/get_user_services.dart';
import 'package:grid/features/post_card/presentation/widgets/announcement_image.dart';
import 'package:grid/features/post_card/presentation/widgets/collage_image_widget.dart';

import 'package:grid/features/post_card/presentation/widgets/post_catagory_card.dart';
import 'package:grid/features/post_card/presentation/widgets/post_video.dart';
import 'package:grid/features/post_card/presentation/widgets/tag_card.dart';
import 'package:grid/model/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.postDocument});

  final DocumentSnapshot postDocument;

  @override
  Widget build(BuildContext context) {
    //Post Document
    final doc = PostModel.fromMap(postDocument.data() as Map<String, dynamic>);

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
                    //Post Type Section

                    if ((doc.postType != 'Common Post') &&
                        (doc.postType != 'Text Post'))
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            if (doc.postType == 'Announcement')
                              PostCatagoryCard(
                                buttonColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                catagoryIcon: Icons.newspaper_rounded,
                                catagoryName: 'Announcement',
                              ),
                            if (doc.postType == 'Project')
                              PostCatagoryCard(
                                buttonColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                catagoryIcon: Icons.account_balance_wallet,
                                catagoryName: 'Project',
                              ),
                            if (doc.postType == 'Idea')
                              PostCatagoryCard(
                                buttonColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                catagoryIcon: Icons.auto_awesome_outlined,
                                catagoryName: 'Idea',
                              ),
                          ],
                        ),
                      ),

                    //Post Announcement Date -------------------

                    if (doc.postType == 'Announcement')
                      const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: TagCard(tagLabel: '8/9/2020'),
                      ),

                    // Post User Section------------------

                    FutureBuilder<DocumentSnapshot>(
                      future: GetUser().getUserDoc(userID: doc.postUserID),
                      builder: (context, userSnapshot) {
                        if (userSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (userSnapshot.hasError) {
                          return Center(
                              child: Text('Error: ${userSnapshot.error}'));
                        }
                        if (!userSnapshot.hasData ||
                            !userSnapshot.data!.exists) {
                          return const Center(child: Text('User not found'));
                        }
                        final postedUser = userSnapshot.data!;
                        return Row(
                          children: [
                            SizedBox(
                              width: 35,
                              height: 35,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/10337/10337609.png',
                                    fit: BoxFit.cover,
                                    height: 35,
                                    width: 35,
                                  )),
                            ),
                            const Gap(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  postedUser['displayName'],
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
                        );
                      },
                    ),
                    const Gap(16),

                    // Post Title----------------------------------

                    Text(
                      doc.postTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Gap(10),

                    // Post Description----------------------------------

                    Text(
                      doc.postDescription,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
              ),
            ),

            // Announcement Image ----------------------------------------

            if ((doc.postType == 'Announcement') &&
                (doc.announcementImage.isNotEmpty))
              AnnouncementImage(imageurl: doc.announcementImage),

            // Post Video -----------------------------------------------

            if ((doc.postType == 'Common Post') &&
                (doc.commonPostType == 'video') &&
                (doc.videoUrl.isNotEmpty))
              PostVideoPlayer(videoUrl: doc.videoUrl),

            if ((doc.postType == 'Common Post') &&
                (doc.commonPostType == 'image') &&
                (doc.imageUrls.isNotEmpty))
              PostImageWidget(imageList: doc.imageUrls),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Post Link-------------------------------------

                    if (doc.link.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Theme.of(context).colorScheme.background),
                          child: Row(
                            children: [
                              Text(
                                'Link : ',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
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
                      ),

                    // Post Tags-----------------------------------
                    if (doc.tags.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Wrap(
                          runSpacing: 10,
                          spacing: 10,
                          children: doc.tags
                              .map((e) => TagCard(tagLabel: e))
                              .toList(),
                        ),
                      ),

                    // Total Likes and Comments------------------------

                    Row(
                      children: [
                        if (doc.allLikes.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                              ],
                            ),
                          ),
                        const Spacer(),
                        if (doc.totalComments != 0)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              '35 Comments',
                              style: displaySmall,
                            ),
                          ),
                      ],
                    ),

                    // Like and Comment Section------------------------

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

                    //Comment TextBox Section--------------------------

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
