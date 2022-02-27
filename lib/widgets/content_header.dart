
import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';
import 'package:flutter_netflix_responsive_ui/widgets/responsive.dart';
import 'package:flutter_netflix_responsive_ui/widgets/vertical_icon_button.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);
  final Content featuredContent;

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: _ContentHeaderMobile(
          featuredContent: featuredContent,
        ),
        desktop: _ContentHeaderDesktop(
          featuredContent: featuredContent,
        ));
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  const _ContentHeaderMobile({Key? key, required this.featuredContent})
      : super(key: key);
  final Content featuredContent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(featuredContent.imageUrl),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 500,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.transparent])),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl!),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                  icon: Icons.add,
                  title: "List",
                  onTap: () {
                    print("list");
                  },
                ),
                _PlayButton(),
                VerticalIconButton(
                  icon: Icons.info_outline,
                  title: "Info",
                  onTap: () {
                    print("info");
                  },
                ),
              ],
            ))
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  const _ContentHeaderDesktop({Key? key, required this.featuredContent})
      : super(key: key);
  final Content featuredContent;

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  late VideoPlayerController _videoPlayerController;
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
    VideoPlayerController.network(widget.featuredContent.videoUrl!)
      ..initialize().then((value) =>
          setState(() {

          }))
      ..play();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _videoPlayerController.value.isPlaying
            ? _videoPlayerController.pause()
            : _videoPlayerController.play();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(aspectRatio: _videoPlayerController.value.isInitialized 
              ? _videoPlayerController.value.aspectRatio
              :2.344,
            child: _videoPlayerController.value.isInitialized 
            ? VideoPlayer(_videoPlayerController) : Image.asset(widget.featuredContent.imageUrl, fit: BoxFit.cover,),
          ),
          Container(
            width: double.infinity,
            height: 1000,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,

                    colors: [Colors.black, Colors.transparent])),
          ),
          Positioned(
              left: 60,
              right: 60,
              bottom: 150,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Image.asset(widget.featuredContent.titleImageUrl!),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(widget.featuredContent.description!, style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      shadows: [Shadow(
                          color: Colors.black,
                          offset: Offset(2, 4),
                          blurRadius: 6
                      )
                      ]
                  ),),
                  SizedBox(height: 20,),
                  Positioned(
                    child: Row(
                      children: [
                        _PlayButton(),
                        SizedBox(width: 16,),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white
                          ),
                          icon: Icon(Icons.info_outline,color: Colors.black,) ,
                          onPressed: () {

                          },
                          label: Text("More Info", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),),
                        ),
                        SizedBox(width: 20,),
                        if (_videoPlayerController.value.isInitialized)
                          IconButton(
                              onPressed: (){
                                setState(() {
                                  _isMuted ? _videoPlayerController.setVolume(100) : _videoPlayerController.setVolume(0);
                                  _isMuted = _videoPlayerController.value.volume == 0;
                                });
                              },
                              icon: Icon( _isMuted ? Icons.volume_off : Icons.volume_up, color: Colors.white,)
                          )
                      ],
                    ),
                  )
                ],
              )
          ),


        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.fromLTRB(15, 5, 20, 5), primary: Colors.white),
      label: Text(
        "Play",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      onPressed: () {},
      icon: Icon(
        Icons.play_arrow,
        size: 30,
        color: Colors.black,
      ),
    );
  }
}
