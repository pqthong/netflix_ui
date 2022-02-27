import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';

class ContentList extends StatelessWidget {
  const ContentList({Key? key,
    required this.title,
    required this.contentList,
    this.isOriginal})
      : super(key: key);
  final String title;
  final List<Content> contentList;
  final bool? isOriginal;

  @override
  Widget build(BuildContext context) {
    bool _isOriginal = isOriginal ?? false;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: _isOriginal ? 500 : 220,
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: ( context, index){
                final content = contentList[index];
                return GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    height: _isOriginal ? 400 : 200,
                    width:  _isOriginal ? 200 : 130 ,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(content.imageUrl),
                        fit: BoxFit.cover
                      )
                    ),
                  ) ,
                );
              }
          ),
        )
      ]),
    );
  }
}
