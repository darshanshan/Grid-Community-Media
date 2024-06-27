import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';
import 'package:grid/core/widgets/button/cancel_button.dart';
import 'package:grid/core/widgets/button/save_button.dart';
import 'package:grid/core/widgets/form_elements/textfield.dart';
import 'package:grid/core/widgets/snackBar/primary_snackbar.dart';
import 'package:grid/features/create_posts/common_post/bloc/common_post_bloc.dart';

import 'package:grid/features/create_posts/widgets/headline_text.dart';
import 'package:grid/features/create_posts/widgets/tag_card.dart';
import 'package:grid/features/home/presentation/home_feed_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CommonPost extends StatefulWidget {
  const CommonPost({super.key});

  @override
  State<CommonPost> createState() => _CommonPostState();
}

class _CommonPostState extends State<CommonPost> {
  bool _isVideo = false;

  void toggleSwitch(bool value) {
    setState(() {
      _isVideo = value;
    });
  }

  String? videoUrl;
  XFile? videoFileUrl;

  List<XFile> imageList = [];

  //Picking Image

  Future<void> pickImage() async {
    final picker = ImagePicker();
    List<XFile>? pickedImages = await picker.pickMultiImage();

    if (pickedImages.isNotEmpty) {
      setState(() {
        imageList.addAll(pickedImages);
      });
    }
  }

  //Video Controller

  VideoPlayerController? _videoController;

  // Initializing Video

  Future<void> _initVideo(String url) async {
    _videoController?.dispose(); // Dispose previous controller if any
    _videoController = VideoPlayerController.file(File(url))
      ..initialize().then((_) {
        setState(
            () {}); // Ensure the state is updated when the video is initialized
        _videoController!.play();
      });
  }

  //Picking Video
  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    try {
      XFile? videoFile = await picker.pickVideo(source: ImageSource.gallery);
      if (videoFile != null) {
        setState(() {
          videoFileUrl = videoFile;
          videoUrl = videoFile.path;
        });
        await _initVideo(videoFile.path);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //Video Widget
  Widget _videoWidget() {
    if (_videoController != null && _videoController!.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _videoController!.value.aspectRatio,
        child: VideoPlayer(_videoController!),
      );
    } else {
      return Center(
          child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ));
    }
  }

  //Text Controllers
  final TextEditingController title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _link = TextEditingController();
  final TextEditingController _tags = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<String> tagsList = [];

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommonPostBloc, CommonPostState>(
      listener: (context, state) {
        if (state is CommonPostErrorState) {
          customSnackBar(context, state.errorText);
        }
        if (state is CommonPostSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeFeed(),
              ));
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          margin: const EdgeInsets.only(top: 25),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            border: Border.all(
                color: Theme.of(context).colorScheme.outline, width: 1),
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
                      'Post your moments',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const Gap(20),
                Divider(
                  color: Theme.of(context).colorScheme.outline,
                  thickness: 1,
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const HeadLineText(labelText: 'Video Post'),
                    const Gap(10),
                    Switch(
                      value: _isVideo,
                      onChanged: toggleSwitch,
                      activeColor:
                          Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ],
                ),
                const Gap(20),

                // Title-----------------------------------------------

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
                const Gap(20),

                // Description----------------------------------

                const HeadLineText(labelText: 'Description'),
                const Gap(10),
                TextFieldWidget(
                  controller: _description,
                  maxLines: 3,
                  hintText: 'Enter Description',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description cannot be empty';
                    }
                    return null;
                  },
                ),
                const Gap(20),

                // Image---------------------------------------------------
                if (!_isVideo)
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadLineText(
                          labelText: 'Image',
                        ),
                        const Gap(10),
                        Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            border: Border.all(
                                color: Theme.of(context).colorScheme.outline,
                                width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              imageList.isNotEmpty
                                  ? ListView.builder(
                                      itemCount: imageList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, ind) => Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.file(
                                                File((imageList[ind].path)),
                                                width: 150,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  imageList.removeAt(ind);
                                                });
                                              },
                                              child: const Icon(
                                                Icons.delete_outline,
                                                color: Colors.red,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: pickImage,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.add_a_photo_outlined,
                                              size: 34,
                                            ),
                                            const Gap(10),
                                            Text(
                                              'Click to pick an image',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                              if (imageList.isNotEmpty)
                                Container(
                                  width: 60,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                          width: 1),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(0))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.image_outlined),
                                      const Gap(5),
                                      Text(
                                        imageList.length.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    ],
                                  ),
                                )
                            ],
                          ),
                        ),
                        const Gap(20),
                      ],
                    ),
                  ),

                // Video-------------------------------------------
                if (_isVideo)
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadLineText(labelText: 'Video'),
                        const Gap(10),
                        Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            border: Border.all(
                                color: Theme.of(context).colorScheme.outline,
                                width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              videoUrl != null
                                  ? Container(
                                      color: Colors.black,
                                      width: double.infinity,
                                      height: double.infinity,
                                      margin: const EdgeInsets.all(5),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: _videoWidget()))
                                  : GestureDetector(
                                      onTap: _pickVideo,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.add_a_photo_outlined,
                                              size: 34,
                                            ),
                                            const Gap(10),
                                            Text(
                                              'Click to pick an Video',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        const Gap(20),
                      ],
                    ),
                  ),

                //Link

                const HeadLineText(labelText: 'Attach Link'),
                const Gap(10),
                TextFieldWidget(controller: _link),
                const Gap(20),

                //Tags

                const HeadLineText(
                  labelText: 'Tags',
                ),
                const Gap(10),
                Row(
                  children: [
                    Expanded(child: TextFieldWidget(controller: _tags)),
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
                          if (_tags.text.isNotEmpty) {
                            setState(() {
                              tagsList.add(_tags.text.trim());
                            });

                            _tags.clear();
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
                Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: tagsList
                      .map<Widget>((tagItem) => TagCardWidget(
                          tagName: tagItem,
                          onPressed: () {
                            setState(() {
                              tagsList.remove(tagItem);
                            });
                          }))
                      .toList(),
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
                    BlocBuilder<CommonPostBloc, CommonPostState>(
                      builder: (context, state) {
                        return SaveButton(
                          isLoading: state is CommonPostLoadingState,
                          labelText: 'Save',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if ((_isVideo == false && imageList.isNotEmpty) ||
                                  (_isVideo == true && videoFileUrl != null)) {
                                context.read<CommonPostBloc>().add(
                                      CreateCommonPostEvent(
                                        postTitle: title.text.trim(),
                                        tags: tagsList,
                                        postDescription:
                                            _description.text.trim(),
                                        link: _link.text.trim(),
                                        isVideo: _isVideo,
                                        images: imageList,
                                        video: videoFileUrl,
                                      ),
                                    );
                              } else if (_isVideo == false &&
                                  imageList.isEmpty) {
                                context.read<CommonPostBloc>().add(
                                    CommonPostErrorEvent(
                                        errorText: 'Select Images to publish'));
                              } else if (_isVideo == true &&
                                  videoFileUrl == null) {
                                context.read<CommonPostBloc>().add(
                                    CommonPostErrorEvent(
                                        errorText: 'Select Video to publish'));
                              }
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
        ),
      ),
    );
  }
}
