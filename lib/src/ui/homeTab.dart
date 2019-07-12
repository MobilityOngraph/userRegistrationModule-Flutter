import 'package:flutter/material.dart';
import 'package:flutter_idealz/src/ui/settings.dart';
import 'package:flutter_idealz/src/utils/_color.dart';
import 'package:flutter_idealz/src/utils/app_utils.dart';
import 'package:page_indicator/page_indicator.dart';

//For Videos
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_idealz/src/modals/ChewieListItem.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeTabState();
  }
}

class HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  ScrollController _scrollController = ScrollController();
  double opacity = 1;
  bool _mute = false;

  double _expandedHeight = 300;

  VideoPlayerController playerController;
  VoidCallback listener;
  PageController _controller =
      new PageController(initialPage: 0, viewportFraction: 1.0);

  final List<String> assetNames = [
    'assets/brady-bellini-212790-unsplash.jpg',
    'assets/stefan-stefancik-105587-unsplash.jpg',
    'assets/simon-fitall-530083-unsplash.jpg',
    'assets/anton-repponen-99530-unsplash.jpg',
    'assets/kevin-cochran-524957-unsplash.jpg',
    'assets/samsommer-72299-unsplash.jpg',
    'assets/simon-matzinger-320332-unsplash.jpg',
    'assets/meng-ji-102492-unsplash.jpg',
  ];

  @override
  void deactivate() {
    playerController.setVolume(0.0);
    playerController.removeListener(listener);
    super.deactivate();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();

    listener = () {
      setState(() {
        print("Loaded Complete");
      });
    };

    _scrollController.addListener(() {});

  }

  bool get _showTitle {
    return _scrollController.hasClients &&
        _scrollController.offset > _expandedHeight - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: _expandedHeight,
            pinned: true,
            backgroundColor: Colors.white,
            title: Container(
                child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.asset(
                  _showTitle ? 'assets/menu_logo.png' : 'assets/left_logo.png',
                ),
                Text("")
              ],
            )),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.dehaze,
                      color: _showTitle ? Colors.black : Colors.white),
                  onPressed: () {
                    // Write code of on Navigation button
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  }),
            ],
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    child: PageIndicatorContainer(
                      pageView: PageView(
                        controller: _controller,
                        physics: AlwaysScrollableScrollPhysics(),
                        children: <Widget>[
                          walk(url: ""),
                          walk(url: ""),
                          walk(url: "")
                        ],
                        scrollDirection: Axis.horizontal,
                      ),
                      align: IndicatorAlign.bottom,
                      length: 3,
                      indicatorSpace: 8.0,
                      indicatorSelectorColor: Colors.blue,
                      indicatorColor: Colors.grey,
                      shape: IndicatorShape.circle(size: 8.0),
                    ),
                  )),
            )),
          ),
          SliverFillRemaining(
              child: Column(
            children: <Widget>[
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      color: Colors.white,
                    ),
                    Container(
                      width: 100.0,
                      color: Colors.white,
                    ),
                    Container(
                      width: 100.0,
                      color: Colors.white,
                    ),
                    Container(
                      width: 100.0,
                      color: Colors.white,
                    ),
                    Container(
                      width: 100.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          )),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Text(''),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }

  create() {
    if (playerController == null) {
      playerController = VideoPlayerController.network(
          'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
        ..addListener(listener)
        ..setVolume(2.0)
        ..initialize()
        ..setLooping(true)
        ..play();
    } else {
      if (playerController.value.isPlaying) {
        //  playerController.pause();
      } else {
        playerController.initialize();
        playerController.play();
      }
    }
    playerController.play();
  }

  Widget walk({Key key, String url}) {
    return new Scaffold(
        body: Stack(
      children: <Widget>[
        new Container(
          child: Container(
            foregroundDecoration: BoxDecoration(),
            child: (playerController != null
                ? VideoPlayer(
                    playerController,
                  )
                : Container(
                    child: Column(
                      children: <Widget>[
                        create(),
                      ],
                    ),
                  )),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 120),
          padding: EdgeInsets.all(5.0),
          alignment: Alignment.center,
          child: Center(

              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Win a brand new mercedes SL400 AMG 2019',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Simply buy a TW  cup for AED630!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new RaisedButton(
                        padding: const EdgeInsets.all(8.0),
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: new Text(
                          "Start shopping",
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                        onPressed: () {},
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                    Text(""),
                    IconButton(
                        icon: new Icon(
                          _mute ? Icons.volume_off : Icons.volume_up,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (!_mute) {
                              _mute = true;
                              playerController.setVolume(0.0);
                            } else {
                              _mute = false;
                              playerController.setVolume(2.0);
                            }
                          });
                        })
                  ],
                ),
              )
            ],
          )),
        ),
      ],
    ));
  }
}

class MyBlinkingButton extends StatefulWidget {
  @override
  _MyBlinkingButtonState createState() => _MyBlinkingButtonState();
}

class _MyBlinkingButtonState extends State<MyBlinkingButton>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animationController,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new LinearProgressIndicator(
              value: 0.1,
              backgroundColor: Colors.red,
            )
          ],
        )
        /*new Slider(min:0.0,max: 100.0,
          activeColor: Colors.red,
          inactiveColor: Colors.grey,
          value: 50, onChanged: null)*/
        /*MaterialButton(
        onPressed: () => null,
        child: Text("Text button"),
        color: Colors.green,
      ),*/
        );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
