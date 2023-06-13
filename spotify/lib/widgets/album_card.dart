import 'package:flutter/material.dart';
import 'package:spotify/views/album_view.dart';

class albumCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final double size;

  const albumCard({
    super.key,
    required this.image,
    required this.label,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumView(
              image: image,
              name: label,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: image,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(label),
        ],
      ),
    );
  }
}
