import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spotify/model.dart';
import 'package:spotify/widgets/song_card.dart';

import '../database.dart';
import '../widgets/album_card.dart';

import '../widgets/rowAlbum_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .6,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 151, 0, 0),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(1),
                ])),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    //-------------------------------------Başlık
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recently Played",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const Row(
                            children: [
                              Icon(Icons.history),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.settings)
                            ],
                          )
                        ],
                      ),
                    ),
                    //---------------------------------------Birinci Satırdaki Şarkı Listesi
                    //CardBuilder(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          albumCard(
                              image: NetworkImage(db[0].image.toString()),
                              label: db[0].name.toString()),
                          SizedBox(
                            width: 15,
                          ),
                          albumCard(
                              image: NetworkImage(db[2].image.toString()),
                              label: db[2].name.toString()),
                          SizedBox(
                            width: 15,
                          ),
                          albumCard(
                              image: NetworkImage(db[3].image.toString()),
                              label: db[3].name.toString()),
                          SizedBox(
                            width: 15,
                          ),
                          albumCard(
                              image: NetworkImage(db[5].image.toString()),
                              label: db[5].name.toString()),
                          SizedBox(
                            width: 15,
                          ),
                          albumCard(
                              image: NetworkImage(db[6].image.toString()),
                              label: db[6].name.toString()),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Good Evening",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              RowAlbumCard(
                                // image: NetworkImage(db[0].image.toString()),
                                // name: db[0].name,
                                // singer: db[0].singer,
                                song: db[0],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              RowAlbumCard(
                                // image: NetworkImage(db[0].image.toString()),
                                // name: db[0].name,
                                // singer: db[0].singer,
                                song: db[1],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              RowAlbumCard(
                                // image: NetworkImage(db[0].image.toString()),
                                // name: db[0].name,
                                // singer: db[0].singer,
                                song: db[2],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              RowAlbumCard(
                                // image: NetworkImage(db[0].image.toString()),
                                // name: db[0].name,
                                // singer: db[0].singer,
                                song: db[3],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              RowAlbumCard(
                                // image: NetworkImage(db[0].image.toString()),
                                // name: db[0].name,
                                // singer: db[0].singer,
                                song: db[4],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              RowAlbumCard(
                                // image: NetworkImage(db[0].image.toString()),
                                // name: db[0].name,
                                // singer: db[0].singer,
                                song: db[5],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Senin Tarzın",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        //---------------------------------------Alltakai satir
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              SongCard(
                                song: db[0],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SongCard(
                                song: db[0],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SongCard(
                                song: db[0],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SongCard(
                                song: db[0],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SongCard(
                                song: db[0],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SongCard(
                                song: db[0],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SongCard(
                                song: db[0],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Sakin Mix",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        //---------------------------------------Alltakai satir
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              SongCard(
                                song: db[0],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SongCard(
                                song: db[0],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SongCard(
                                song: db[0],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SongCard(
                                song: db[0],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SongCard(
                                song: db[0],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SongCard(
                                song: db[0],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SongCard(
                                song: db[0],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ]),
            ),
          ),
        )
      ],
    ));
  }

  Future<List<MusicModel>> jsonToMusic() async {
    try {
      String okunanJson =
          await DefaultAssetBundle.of(context).loadString("assets/music.json");
      var okunanDeger = jsonDecode(okunanJson);
      List<MusicModel> musicList =
          (okunanDeger as List).map((e) => MusicModel.fromJson(e)).toList();
      return musicList;
    } catch (e) {
      print(e);
      return Future.error(e.toString());
    }
  }
}
