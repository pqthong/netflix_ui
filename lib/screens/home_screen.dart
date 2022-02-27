import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/content_header.dart';

import '../assets.dart';
import '../data/data.dart';
import '../widgets/content_list.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/previews.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key = const PageStorageKey('homeScreen')}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _scrollOffset = 0;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 50),
          child: CustomAppBar(
            scrollOffset: _scrollOffset,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[850],
          onPressed: () {
            print("cast");
          },
          child: Icon(Icons.cast),
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
                child: ContentHeader(
              featuredContent: sintelContent,
            )),
            SliverPadding(
              padding: EdgeInsets.only(top: 20),
              sliver: SliverToBoxAdapter(
                child: Previews(
                  title: "Previews",
                  contentList: previews,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ContentList(
                title: "My List",
                contentList: myList,
              ),
            ),
            SliverToBoxAdapter(
              child: ContentList(
                  title: "Netflix Original",
                  contentList: myList,
                  isOriginal: true),
            ),
            SliverPadding(
              sliver: SliverToBoxAdapter(
                child: ContentList(
                  title: "Trending",
                  contentList: myList,
                ),
              ),
              padding: EdgeInsets.only(bottom: 20),
            )
          ],
        ));
  }
}
