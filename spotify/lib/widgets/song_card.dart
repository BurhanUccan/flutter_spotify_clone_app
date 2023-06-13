import 'package:flutter/material.dart';

import '../database.dart';

class SongCard extends StatelessWidget {
  final Song song;
  const SongCard({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      child: Column(
        children: [
          Image(
            image: NetworkImage(song.image),
            width: 140,
            height: 140,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            song.singer,
            style: Theme.of(context).textTheme.caption,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
