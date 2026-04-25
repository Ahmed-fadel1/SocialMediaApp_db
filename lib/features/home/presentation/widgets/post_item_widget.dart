import 'package:flutter/material.dart';
import 'package:social_media_app/features/home/models/post_model.dart';

class PostItemWidget extends StatelessWidget {
  final PostModel post;
  const PostItemWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(
                  post.authorimageUrl ?? '',
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.person, size: 50);
                  },
                ),

                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(post.authorName ?? 'Unknown'),
                    const SizedBox(width: 8),
                    Text(post.createdAt.substring(0, 10)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(post.text),
            if (post.imageUrl != null || post.videoUrl != null)
              Image.network(post.imageUrl ?? '', fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
