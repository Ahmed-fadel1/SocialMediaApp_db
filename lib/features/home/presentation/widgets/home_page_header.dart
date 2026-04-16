import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          height: 35,
          width: size.width * 0.5,
          "assets/images/logo.png",
        ),
        Row(
          children: [
            IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: Icon(Icons.notifications_none_rounded),
            ),
          ],
        ),
      ],
    );
  }
}
