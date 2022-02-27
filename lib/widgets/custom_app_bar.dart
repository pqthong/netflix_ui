import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/responsive.dart';

import '../assets.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
    required this.scrollOffset,
  }) : super(key: key);
  final double scrollOffset;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color: Colors.black
          .withOpacity((widget.scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(Assets.netflixLogo0),
            _AppBarButtons(
                title: "Tv Shows",
                onTap: () {
                  print("Tv Shows");
                }),
            _AppBarButtons(
                title: "Movies",
                onTap: () {
                  print("Tv Shows");
                }),
            _AppBarButtons(
                title: "My List",
                onTap: () {
                  print("Tv Shows");
                }),
          ],
        ),
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(Assets.netflixLogo1),
            SizedBox(
              width: 12,
            ),
            _AppBarButtons(
                title: "Home",
                onTap: () {
                  print("Home");
                }),
            _AppBarButtons(
                title: "Tv Shows",
                onTap: () {
                  print("Tv Shows");
                }),
            _AppBarButtons(
                title: "Movies",
                onTap: () {
                  print("Tv Shows");
                }),
            _AppBarButtons(
                title: "Latest",
                onTap: () {
                  print("Tv Shows");
                }),
            _AppBarButtons(
                title: "My List",
                onTap: () {
                  print("Tv Shows");
                }),
            SizedBox(width: 500,),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 28,
                  color: Colors.white,
                )),
            _AppBarButtons(
                title: "KIDS",
                onTap: () {
                  print("KIDS");
                }),
            _AppBarButtons(
                title: "DVD",
                onTap: () {
                  print("DVD");
                }),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.card_giftcard,
                  size: 28,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  size: 28,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}

class _AppBarButtons extends StatelessWidget {
  const _AppBarButtons({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 12),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
