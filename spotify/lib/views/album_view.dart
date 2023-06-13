import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:palette_generator/palette_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/sabitler.dart';
import 'package:spotify/widgets/play_card.dart';

import '../database.dart';

class AlbumView extends StatefulWidget {
  final ImageProvider image;
  final String name;

  const AlbumView({super.key, required this.image, required this.name});
  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late ScrollController scrollController;
  double imageSize = 0;
  double initalSize = 240;
  double containerHigh = 500;
  double containerInitialHigh = 500;
  double imageOpacity = 1;
  bool showTopBar = false;

  Color backColor = Colors.transparent;
  late PaletteGenerator _generator;
  List<String> begenilenList = [];

  @override
  void initState() {
    imageSize = initalSize;
    setBackGround();
    begenilenleriGetir();

    scrollController = ScrollController()
      ..addListener(() {
        imageSize = initalSize - scrollController.offset;

        if (imageSize < 0) {
          imageSize = 0;
        }
        containerHigh = containerInitialHigh - scrollController.offset;
        if (containerHigh < 0) {
          containerHigh = 0;
        }
        imageOpacity = imageSize / initalSize;
        if (scrollController.offset > 224) {
          showTopBar = true;
        } else {
          showTopBar = false;
        }
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            clipBehavior: Clip.none,
            height: containerHigh,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: backColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: imageOpacity.clamp(0, 1.0),
                  child: Container(
                    clipBehavior: Clip.none,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.5),
                          offset: Offset(0, 20),
                          blurRadius: 32)
                    ]),
                    child: Stack(children: [
                      Image(
                        image: widget.image,
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                      ),
                      // Positioned(
                      //   //------------------------------!!!!!!!!!!!!!RESİM ÜSTÜNDEKİ YAZI
                      //   // top: 208 - scrollController.offset,
                      //   //left: 10 - scrollController.offset / 2,
                      //   child: Container(
                      //     clipBehavior: Clip.none,
                      //     child: Text(
                      //       widget.name,
                      //       style: GoogleFonts.montserrat(
                      //           fontSize: 26, fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // )
                    ]),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.none,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          SizedBox(
                            height: initalSize + 32,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage("assets/logo.png"),
                                      width: 28,
                                      height: 28,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text("Spotify")
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "188,156.742 likes",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.favorite),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Icon(Icons.more_horiz),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.black,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Yukarıdaki kodda, SpotifyApi sınıfını kullanarak API isteğini yapabilir ve sonucunu alabilirsiniz. Benzer şekilde, diğer API yöntemlerini kullanarak müzik arama, "),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Column(
                                children: listeDondur(),
                              ))
                        ]),
                  ),
                ],
              ),
            ),
          ),

          //appBar
          // ---------------------------------Geri Gitme Oku
          Positioned(
              child: Container(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              color: showTopBar
                  ? backColor.withOpacity(1)
                  : backColor.withOpacity(0),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SafeArea(
                child: Container(
                  height: 38,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 0,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 250),
                        opacity: showTopBar ? 1 : 0,
                        child: Text(
                          widget.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom:
                            80 - containerHigh.clamp(120.0, double.infinity),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff14D860)),
                              child: Icon(Icons.play_arrow, size: 38),
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.shuffle,
                                color: Colors.black,
                                size: 14,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  void setBackGround() async {
    _generator = await PaletteGenerator.fromImageProvider(widget.image);
    backColor = _generator.dominantColor!.color;
    setState(() {});
  }

  List<PlayCard> listeDondur() {
    List<PlayCard> liste = [];

    if (widget.name != "Beğenilen Şarkılar") {
      for (int i = 0; i < db.length; i++) {
        liste.add(
          PlayCard(
            song: db[i],
          ),
        );
      }
      return liste;
    } else {
      for (int i = 0; i <= begenilenList.length + 1; i++) {
        if (begenilenList
                .where((element) => element.contains((i + 1).toString()))
                .firstOrNull !=
            null) {
          liste.add(
            PlayCard(
              song: db[i],
            ),
          );
        }
      }
      return liste;
    }
  }

  Future<void> begenilenleriGetir() async {
    final prefs = await SharedPreferences.getInstance();
    begenilenList = prefs.getStringList("fovoriler") ?? [];
  }
}
