import 'package:flutter/cupertino.dart';
import 'package:social_media_app/core/utils/router/app_routes.dart';
import 'package:social_media_app/core/views/not_found_page.dart';
import 'package:social_media_app/features/auth/views/pages/auth_page.dart';
import 'package:social_media_app/features/home/home_page.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return CupertinoPageRoute(builder: (_) => const HomePage());
      case AppRoutes.authRoute:
        return CupertinoPageRoute(builder: (_) => const AuthPage());
      default:
        return CupertinoPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
