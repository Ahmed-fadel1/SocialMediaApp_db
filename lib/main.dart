import 'package:flutter/material.dart';
import 'package:social_media_app/core/utils/app_constants.dart';
import 'package:social_media_app/core/utils/app_theme.dart';
import 'package:social_media_app/core/utils/router/app_router.dart';
import 'package:social_media_app/core/utils/router/app_routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    anonKey: AppConstants.supabaseKey,
  );
  runApp(SocialMediaApp());
}

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      onGenerateRoute: (settings) => AppRouter().generateRoute(settings),
      initialRoute: AppRoutes.authRoute,
    );
  }
}
