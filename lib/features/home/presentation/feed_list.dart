import 'package:flutter/material.dart';
import 'package:grid/features/post_card/presentation/post_card.dart';

class FeedStream extends StatelessWidget {
  const FeedStream({super.key, required this.feedStream});
  final Stream feedStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: feedStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          final feedDocs = snapshot.data.docs;
          return ListView.builder(
            itemCount: feedDocs.length,
            itemBuilder: (context, index) {
              final postDoc = feedDocs[index];
              return PostCard(document: postDoc);
            },
          );
        });
  }
}
