import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database.dart';

import '../sabitler.dart';

class PlayView extends StatefulWidget {
  // final ImageProvider image;
  // final String name;
  // final String singer;
  final Song song;

  const PlayView({
    super.key,
    required this.song,
  });

  @override
  State<PlayView> createState() => _PlayViewState();
}

class _PlayViewState extends State<PlayView> {
  late AudioPlayer audioPlayer;
  bool isPlay = false;
  double progress = 0.0;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  Color arkaRenk = Colors.transparent;
  late PaletteGenerator _generator;
  Song? localSong;

  bool isFavorite = false;
  Icon favoriteIcon = Icon(Icons.favorite_border_outlined, color: Colors.grey);
  bool isShuffle = false;
  Icon shuffleIcon = Icon(
    Icons.shuffle,
    color: Colors.green,
  );
  Icon playButtonIcon = Icon(
    Icons.play_circle,
  );
  final controller = CarouselController();

  late List<String> favoriMuzikler;

  @override
  initState() {
    super.initState();
    //favorileriGetir();
    localSong = widget.song;
    setBackGround();
    audioPlayer = AudioPlayer();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlay = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    favoriKontrol();
  }

  @override
  Widget build(BuildContext context) {
    final List<Song> songList = db as List<Song>;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [arkaRenk, Colors.black.withOpacity(.001)]),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //-------------------------------Üst Başlık
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 38,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "KİTAPLIĞIN'DAN ÇALINIYOR",
                              style: Sabitler.liteFontStyle,
                            ),
                            Text(
                              "Beğenilen Şarkılar",
                              style: Sabitler.boldFontStyle,
                            ),
                          ],
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 38,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //------------------------- Ana Resim
                  CarouselSlider(
                    carouselController: controller,
                    items: songList
                        .map((e) => Image(
                              image: NetworkImage(e.image.toString()),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      aspectRatio: 1.2,
                      enlargeCenterPage: true,
                      autoPlay: false,
                      initialPage: int.parse(localSong!.id) - 1,
                      onPageChanged: (index, reason) {
                        musikDegisti(db[index]);
                      },
                    ),
                  ),

                  //ImageSlider(),

                  // Container(
                  //   width: MediaQuery.of(context).size.width - 100,
                  //   height: MediaQuery.of(context).size.width - 100,
                  //   child: Image(
                  //     image: widget.image,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  //----------------------------Müzik Adı
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  localSong!.name,
                                  style: GoogleFonts.nunito(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  localSong!.singer,
                                  style: GoogleFonts.nunito(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              iconSize: 30,
                              onPressed: () {
                                if (isFavorite) {
                                  {
                                    favoriCikar(localSong!);
                                  }
                                } else {
                                  favoriKaydet(localSong!);
                                }
                              },
                              icon: favoriteIcon,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //----------------------------- Time Line

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ProgressBar(
                      progress: position,
                      total: duration,
                      thumbColor: Colors.white,
                      progressBarColor: Colors.white,
                      onSeek: (a) async {
                        if (isPlay) {
                          await audioPlayer.stop(); // Müziği durdur
                          await audioPlayer.seek(a);
                          await playMusic();
                        } else {
                          await audioPlayer.seek(
                              a); // Müziği durdurmadan ileri veya geri sarma
                        }
                        setState(() {
                          position = a; // Mevcut konumu güncelle
                        });
                      },
                    ),
                  ),

                  //------------------------ Başlangiç Bitiş Tarihleri

                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                if (isShuffle) {
                                  isShuffle = false;
                                  shuffleIcon = Icon(
                                    Icons.shuffle,
                                    color: Colors.green,
                                  );
                                } else {
                                  isShuffle = true;
                                  shuffleIcon = Icon(
                                    Icons.shuffle,
                                    color: Colors.white,
                                  );
                                }
                                setState(() {});
                              },
                              icon: shuffleIcon),
                          IconButton(
                            iconSize: 45,
                            onPressed: () {
                              controller.previousPage();
                            },
                            icon: Icon(
                              Icons.skip_previous,
                            ),
                          ),
                          IconButton(
                              iconSize: 75,
                              onPressed: () async {
                                if (isPlay) {
                                  stopMusic();
                                } else {
                                  if (position == Duration.zero) {
                                    playMusic();
                                  } else {
                                    resumeMusic();
                                  }
                                }
                                setState(() {});
                              },
                              icon: playButtonIcon),
                          IconButton(
                              iconSize: 45,
                              onPressed: () {
                                controller.nextPage();
                              },
                              icon: Icon(
                                Icons.skip_next,
                              )),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.replay)),
                        ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void setBackGround() async {
    _generator = await PaletteGenerator.fromImageProvider(
        NetworkImage(localSong!.image.toString()));
    arkaRenk = _generator.dominantColor!.color;
    setState(() {});
  }

  void musikDegisti(Song changingSong) {
    localSong = changingSong;
    setBackGround();
    favoriKontrol();
    stopMusic();
    if (isPlay) {
      playMusic();
    } else {}
  }

  Future<void> playMusic() async {
    final audioUrl = localSong!.music.toString();
    final source = UrlSource(audioUrl);
    await audioPlayer.play(source);
    playButtonIcon = Icon(Icons.pause_circle_filled);
  }

  Future<void> stopMusic() async {
    await audioPlayer.pause();
    playButtonIcon = Icon(Icons.play_circle);
  }

  Future<void> resumeMusic() async {
    await audioPlayer.seek(position);
    final audioUrl = localSong!.music.toString();
    final source = UrlSource(audioUrl);
    await audioPlayer.play(source);
    playButtonIcon = Icon(Icons.pause_circle_filled);
  }

//-------------------------------------------- Favori İşlemleri

  Future<void> favoriKaydet(Song song) async {
    String? sonuc = favoriMuzikler
        .where((element) => element.contains(song.id))
        .firstOrNull;
    if (sonuc == null) {
      final kayit = await SharedPreferences.getInstance();
      favoriMuzikler.add(localSong!.id);
      kayit.setStringList("fovoriler", favoriMuzikler);
      favoriteIcon = Icon(Icons.favorite, color: Colors.green);
      isFavorite = true;

      setState(() {});
      print(kayit.getStringList("fovoriler"));
    } else {}
  }

  Future<void> favoriCikar(Song song) async {
    String? sonuc = favoriMuzikler
        .where((element) => element.contains(song.id))
        .firstOrNull;
    if (sonuc != null) {
      final kayit = await SharedPreferences.getInstance();
      favoriMuzikler.remove(sonuc);
      kayit.setStringList("fovoriler", favoriMuzikler);
      favoriteIcon = Icon(Icons.favorite_border_outlined, color: Colors.grey);
      isFavorite = false;
      setState(() {});
      print(kayit.getStringList("fovoriler"));
    } else {}
  }

  void favorileriGetir() async {
    final kayit = await SharedPreferences.getInstance();
    favoriMuzikler = kayit.getStringList("fovoriler") ?? [];
  }

  Future<void> favoriKontrol() async {
    final kayit = await SharedPreferences.getInstance();
    favoriMuzikler = kayit.getStringList("fovoriler") ?? [];

    if (favoriMuzikler.length != 0) {
      var kontrol = favoriMuzikler
          .where((element) => element.contains(localSong!.id))
          .firstOrNull;
      if (kontrol == null) {
        isFavorite = false;
        favoriteIcon = Icon(Icons.favorite_border_outlined, color: Colors.grey);
      } else {
        isFavorite = true;
        favoriteIcon = Icon(Icons.favorite, color: Colors.green);
      }
      setState(() {});
    }
  }
}
