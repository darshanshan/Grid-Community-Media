import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';
import 'package:grid/core/widgets/button/cancel_button.dart';
import 'package:grid/core/widgets/button/save_button.dart';
import 'package:grid/core/widgets/form_elements/textfield.dart';
import 'package:grid/core/widgets/snackBar/primary_snackbar.dart';
import 'package:grid/features/home/presentation/home_feed_screen.dart';

import 'package:grid/features/create_posts/text_post/bloc/text_post_bloc.dart';
import 'package:grid/features/create_posts/widgets/headline_text.dart';
import 'package:grid/features/create_posts/widgets/tag_card.dart';

class TextPost extends StatefulWidget {
  const TextPost({
    super.key,
  });

  @override
  State<TextPost> createState() => _TextPostState();
}

class _TextPostState extends State<TextPost> {
  // TextEditing Controllers
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController link = TextEditingController();
  final TextEditingController tags = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    title;
    description;
    link;
    tags;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TextPostBloc, TextPostState>(
      listener: (context, state) {
        if (state is TextPostSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeFeed(),
              ));
          customSnackBar(context, 'Posted successfully...');
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.outline),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            size: 18,
                          ),
                        ),
                        const Gap(15),
                        Text(
                          'Post your thoughts',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const Gap(20),
                    Divider(
                      color: Theme.of(context).colorScheme.outline,
                      thickness: 1,
                    ),
                    const Gap(20),
                    const HeadLineText(
                      labelText: 'Title',
                    ),
                    const Gap(10),
                    TextFieldWidget(
                      controller: title,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const Gap(10),
                    const HeadLineText(
                      labelText: 'Post Description',
                    ),
                    const Gap(10),
                    TextFieldWidget(
                      controller: description,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'post description cannot be empty';
                        }
                        return null;
                      },
                      hintText: 'Enter description...',
                      maxLines: 3,
                    ),
                    const Gap(10),
                    const HeadLineText(
                      labelText: 'Attach Link',
                    ),
                    const Gap(10),
                    TextFieldWidget(controller: link),
                    const Gap(10),
                    const HeadLineText(
                      labelText: 'Tags',
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Expanded(child: TextFieldWidget(controller: tags)),
                        //if (tags.text.isNotEmpty)
                        const Gap(20),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: IconButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.primaryContainer,
                            )),
                            onPressed: () {
                              if (tags.text.isNotEmpty) {
                                context.read<TextPostBloc>().add(
                                    TextPostAddTagEvent(tag: tags.text.trim()));
                                tags.clear();
                              } else {
                                return;
                              }
                            },
                            icon: const Icon(Icons.check_rounded),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    BlocBuilder<TextPostBloc, TextPostState>(
                      builder: (context, state) {
                        if (state is TextPostTagsState) {
                          final tagsList = state.tags;
                          return Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: tagsList
                                .map<Widget>((tagItem) => TagCardWidget(
                                    tagName: tagItem,
                                    onPressed: () {
                                      context.read<TextPostBloc>().add(
                                          TextPostRemoveTagEvent(
                                              tagIndex:
                                                  tagsList.indexOf(tagItem)));
                                    }))
                                .toList(),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    const Gap(25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CancelButton(
                            labelText: 'Cancel',
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        const Gap(10),
                        BlocBuilder<TextPostBloc, TextPostState>(
                          builder: (context, state) {
                            return SaveButton(
                              isLoading: state is TextPostLoadingState,
                              labelText: 'Save',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<TextPostBloc>().add(
                                        CreateTextPostEvent(
                                          title: title.text.trim(),
                                          description: description.text.trim(),
                                          link: link.text.trim(),
                                        ),
                                      );
                                }
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
