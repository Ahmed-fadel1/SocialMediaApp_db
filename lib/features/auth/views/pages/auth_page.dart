import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/auth/cubit/auth_cubit.dart';
import 'package:social_media_app/features/auth/views/pages/sign_in_page.dart';
import 'package:social_media_app/features/auth/views/pages/sign_up_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              // ده تمام عشان الكيبورد
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    // Logo Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9E9FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.chat_bubble_outline,
                            color: Color(0xFF4A78FF),
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "SOCIAL MATE",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A3B5D),
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // Tabs Section
                    const TabBar(
                      indicatorColor: Color(0xFF4A78FF),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "Sign In"),
                        Tab(text: "Sign up"),
                      ],
                    ),

                    SizedBox(
                      height: 500, // زودنا الارتفاع شوية عشان الـ SignUp
                      child: TabBarView(children: [SignInPage(), SignUpPage()]),
                    ),

                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or Sign In With",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _socialIcon('assets/google.png', Colors.red),
                        _socialIcon('assets/facebook.png', Colors.blue),
                        _socialIcon('assets/apple.png', Colors.black),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialIcon(String path, Color color) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(Icons.circle, color: color),
        onPressed: () {},
      ),
    );
  }
}
