import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/home/cubit/home_cubit.dart';
import 'package:social_media_app/features/home/presentation/widgets/home_page_header.dart';
import 'package:social_media_app/features/home/presentation/widgets/post_writing_widget.dart';
import 'package:social_media_app/features/home/presentation/widgets/posts_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = HomeCubit();
        cubit.fetchStories();
        cubit.fetchPosts();
        return cubit;
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                HomePageHeader(),
                SizedBox(height: 20),
                PostWritingCard(),
                SizedBox(height: 20),
                // SotiresSection(),
                SizedBox(height: 20),
                PostsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
