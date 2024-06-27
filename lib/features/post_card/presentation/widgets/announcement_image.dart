import 'package:flutter/material.dart';

class AnnouncementImage extends StatelessWidget {
  const AnnouncementImage({super.key, required this.imageurl});
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      color: Theme.of(context).colorScheme.background,
      child: Image.network(
        imageurl,
        height: 400,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
