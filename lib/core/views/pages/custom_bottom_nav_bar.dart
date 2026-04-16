import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:social_media_app/features/discover/discover_people.dart';
import 'package:social_media_app/features/home/presentation/home_page.dart';
import 'package:social_media_app/features/profile/profile_page.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: HomePage(),
          item: ItemConfig(icon: Icon(Icons.home), title: "Home"),
        ),
        PersistentTabConfig(
          screen: DiscoverPeople(),
          item: ItemConfig(
            icon: Icon(Icons.group_add_rounded),
            title: "Messages",
          ),
        ),
        PersistentTabConfig(
          screen: ProfilePage(),
          item: ItemConfig(icon: Icon(Icons.person), title: "Settings"),
        ),
      ],
      navBarBuilder: (navBarConfig) =>
          Style5BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}
