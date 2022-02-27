import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';

class Previews extends StatelessWidget {
  const Previews({Key? key, required this.title, required this.contentList})
      : super(key: key);
  final String title;
  final List<Content> contentList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 165,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              itemCount: contentList.length,
              itemBuilder: (context, index) {
                final Content content = contentList[index];
                return GestureDetector(
                  onTap: () {},
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  content.imageUrl,
                                ),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: content.color!, width: 4.0)),
                      ),
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black87,
                                Colors.black45,
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter
                            ),
                            shape: BoxShape.circle,
                           ),
                      ),
                      Positioned(
                        child: SizedBox(
                          height: 60,
                          child: Image.asset(content.titleImageUrl!),
                        ),
                        bottom: 0,
                        left: 0,
                        right: 0,
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
