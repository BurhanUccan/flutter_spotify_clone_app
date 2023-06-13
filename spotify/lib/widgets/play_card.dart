import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../database.dart';
import '../views/play.dart';

class PlayCard extends StatefulWidget {
  // final ImageProvider image;
  // final String name;
  // final String singer;
  final Song song;

  const PlayCard({
    super.key,
    required this.song,
    // required this.image,
    // required this.name,
    // required this.singer
  });

  @override
  State<PlayCard> createState() => _PlayCardState();
}

class _PlayCardState extends State<PlayCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width / 5.5;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlayView(
                      // image: widget.image,
                      // name: widget.name,
                      // singer: widget.singer,
                      song: widget.song,
                    )));
      },
      child: Container(
        width: width,
        height: height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 2,
            ),
            Expanded(
                flex: 1, child: Image(image: NetworkImage(widget.song.image))),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.song.name,
                    style: GoogleFonts.nunito(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    widget.song.singer,
                    style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(.6)),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                Icons.play_arrow,
                size: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
