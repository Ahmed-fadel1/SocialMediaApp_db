import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/home/cubit/home_cubit.dart';
import 'package:social_media_app/features/home/presentation/widgets/post_item_widget.dart';

class PostsSection extends StatelessWidget {
  const PostsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is PostsLoading ||
          current is PostsLoaded ||
          current is PostsError,
      builder: (context, state) {
        if (state is PostsLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        if (state is PostsError) {
          return Center(child: Text('Error : ${state.message}'));
        }

        if (state is PostsLoaded) {
          final posts = state.posts; // الداتا هنا جاية من الـ State مباشرة

          if (posts.isEmpty) {
            return const Center(child: Text('No posts available'));
          }

          return ListView.builder(
            shrinkWrap: true, // عشان لو جوه Column ميعملش Error
            physics:
                const NeverScrollableScrollPhysics(), // لو الـ Screen كلها بتعمل scroll
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostItemWidget(post: post);
            },
          );
        }

        // حالة الـ Initial أو أي حالة تانية
        return const SizedBox.shrink();
      },
    );
  }
}
