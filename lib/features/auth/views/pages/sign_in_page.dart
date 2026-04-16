import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/utils/router/app_routes.dart';
import 'package:social_media_app/features/auth/cubit/auth_cubit.dart';
import 'package:social_media_app/features/auth/views/widgets/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            hint: "Email",
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          CustomTextField(
            hint: "Password",
            controller: passwordController,
            isPassword: true,
            validator: (value) {
              if (value == null || value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: BlocConsumer<AuthCubit, AuthState>(
              listenWhen: (previous, current) =>
                  current is AuthSuccess || current is AuthFaliure,
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamed(context, AppRoutes.homeRoute);
                }
                if (state is AuthFaliure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              buildWhen: (previous, current) =>
                  current is AuthLoading ||
                  current is AuthSuccess ||
                  current is AuthFaliure,
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

                return ElevatedButton(
                  onPressed: () async {
                    print("object");
                    if (_formKey.currentState!.validate()) {
                      await authCubit.signin(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5C7CFA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
