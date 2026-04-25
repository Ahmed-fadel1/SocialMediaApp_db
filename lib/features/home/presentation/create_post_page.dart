import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/home/cubit/home_cubit.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  late final HomeCubit cubit;
  @override
  void initState() {
    cubit = context.read<HomeCubit>();
    cubit.fetchInitalCreatePostData();
    super.initState();
    _textController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textController.removeListener(() {});
    _textController.dispose();
    super.dispose();
  }

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.grey),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Create Post',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          BlocConsumer<HomeCubit, HomeState>(
            listenWhen: (previous, current) =>
                current is PostCreated || current is PostCreationError,
            listener: (context, state) {
              if (state is PostCreated) {
                Navigator.pop(context);
              }
              if (state is PostCreationError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            buildWhen: (previous, current) =>
                current is PostCreating ||
                current is PostCreationError ||
                current is PostCreated,
            builder: (context, state) {
              if (state is PostCreating) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return TextButton(
                onPressed: () async {
                  await cubit.createPost(text: _textController.text);
                },
                child: const Text(
                  'Post',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) => current is PostCreatingInitial,
              builder: (context, state) {
                if (state is PostCreatingInitialLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is PostCreatingInitial) {
                  final userData = state.currentUser;
                  return Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: userData.imageUrl != null
                            ? CachedNetworkImageProvider(userData.imageUrl!)
                            : null,
                        radius: 25,
                        backgroundColor: Colors.blueAccent, // لون افتراضي
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        userData.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 20),

            TextField(
              onChanged: (value) {
                setState(() {
                  _textController.text = value;
                });
              },
              maxLines: null,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                border: InputBorder.none,
              ),
            ),

            const Divider(),

            // 4. خيارات الإضافة (Post Options)
            _buildPostOption(
              icon: Icons.camera_alt,
              color: Colors.blue,
              label: 'Camera',
              onTap: () {},
            ),
            _buildPostOption(
              icon: Icons.image,
              color: Colors.blue,
              label: 'Upload Image',
              onTap: () {},
            ),
            _buildPostOption(
              icon: Icons.description,
              color: Colors.blue,
              label: 'Upload File',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostOption({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(label),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}
