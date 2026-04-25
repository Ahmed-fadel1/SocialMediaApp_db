import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:social_media_app/core/utils/router/app_routes.dart';
import 'package:social_media_app/core/views/not_found_page.dart';
import 'package:social_media_app/core/views/pages/custom_bottom_nav_bar.dart';
import 'package:social_media_app/features/auth/views/pages/auth_page.dart';
import 'package:social_media_app/features/auth/views/pages/sign_in_page.dart';
import 'package:social_media_app/features/auth/views/pages/sign_up_page.dart';
import 'package:social_media_app/features/home/cubit/home_cubit.dart';
import 'package:social_media_app/features/home/presentation/create_post_page.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return CupertinoPageRoute(builder: (_) => const CustomBottomNavBar());
      case AppRoutes.authRoute:
        return CupertinoPageRoute(builder: (_) => const AuthPage());
      case AppRoutes.signIn:
        return CupertinoPageRoute(builder: (_) => const SignInPage());
      case AppRoutes.createPost:
        return CupertinoPageRoute(builder: (_) => const CreatePostScreen());

      case AppRoutes.signUp:
        return CupertinoPageRoute(builder: (_) => const SignUpPage());
      default:
        return CupertinoPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
