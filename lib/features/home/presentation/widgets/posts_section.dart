import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/home/cubit/home_cubit.dart';
import 'package:social_media_app/features/home/presentation/widgets/post_item_widget.dart';

class PostsSection extends StatefulWidget {
  const PostsSection({super.key});

  @override
  State<PostsSection> createState() => _PostsSectionState();
}

class _PostsSectionState extends State<PostsSection> {
  @override
  void initState() {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    homeCubit.refresh();
    super.initState();
  }

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
          final posts = state.posts;

          if (posts.isEmpty) {
            return const Center(child: Text('No posts available'));
          }

          return ListView.builder(
            reverse: true,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostItemWidget(post: post);
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
