import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PostVideoPlayer extends StatefulWidget {
  const PostVideoPlayer({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<PostVideoPlayer> createState() => _PostVideoPlayerState();
}

class _PostVideoPlayerState extends State<PostVideoPlayer> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    _videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _videoController.initialize().then((_) => setState(() {}));
    // _videoController.setLooping(true);
    _videoController.play();
    super.initState();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  Widget _videoWidget() {
    if (_videoController.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _videoController.value.aspectRatio,
        child: VideoPlayer(_videoController),
      );
    } else {
      return Center(
          child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Theme.of(context).colorScheme.background,
      child: _videoWidget(),
    );
  }
}
