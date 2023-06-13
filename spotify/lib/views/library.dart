import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/other_material.dart';

import 'album_view.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  List<String> keyList = [];
  @override
  void initState() {
    keyleriGetir();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Your Library",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                        iconSize: 30,
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                        )),
                    IconButton(
                        iconSize: 30, onPressed: () {}, icon: Icon(Icons.add)),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_upward,
                  size: 13,
                ),
                Icon(
                  Icons.arrow_downward,
                  size: 13,
                ),
                SizedBox(
                  width: 12,
                ),
                Text("Son Oynatılanlar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: keyList.length,
                itemBuilder: (context, index) {
                  return LibraryGenerate();
                },
              ),
            )
            //Expanded(child: ListView.builder(itemCount: 1,itemBuilder: ))
          ],
        ),
      ),
    );
  }

  Future<void> keyleriGetir() async {
    final prefs = await SharedPreferences.getInstance();
    keyList = prefs.getKeys().toList();
  }
}

class LibraryGenerate extends StatefulWidget {
  const LibraryGenerate({super.key});

  @override
  State<LibraryGenerate> createState() => _LibraryGenerateState();
}

class _LibraryGenerateState extends State<LibraryGenerate> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumView(
              image: NetworkImage(
                  "https://misc.scdn.co/liked-songs/liked-songs-300.png"),
              name: "Beğenilen Şarkılar",
            ),
          ),
        );
      },
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              height: 70,
              width: 70,
              image: NetworkImage(
                  "https://misc.scdn.co/liked-songs/liked-songs-300.png"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 400,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Beğendiklerim",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.push_pin,
                      color: Colors.green,
                      size: 10,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text("Playlist",
                        style: TextStyle(
                            color: Colors.white.withOpacity(.6),
                            fontSize: 13,
                            fontWeight: FontWeight.w300)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
