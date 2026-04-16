import 'package:flutter/material.dart';
import 'package:social_media_app/features/home/presentation/widgets/home_page_header.dart';
import 'package:social_media_app/features/home/presentation/widgets/post_writing_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            HomePageHeader(),
            SizedBox(height: 20),
            PostWritingWidget(),
          ],
        ),
      ),
    );
  }
}
