import 'package:flutter/material.dart';

import '../database.dart';
import '../views/play.dart';

class RowAlbumCard extends StatelessWidget {
  // final ImageProvider image;
  // final String label;
  // final String singer;
  final Song song;

  const RowAlbumCard({
    super.key,
    // required this.image,
    // required this.label,
    // required this.singer,
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlayView(
                        // image: image,
                        // name: label,
                        // singer: singer,
                        song: song,
                      )));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(4),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Image(
                image: NetworkImage(song.image.toString()),
                height: 48,
                width: 48,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    song.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
