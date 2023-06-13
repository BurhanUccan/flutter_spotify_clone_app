import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../database.dart';

class ImageSlider extends StatelessWidget {
  ImageSlider({super.key});
  final List<Song> songList = db as List<Song>;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: songList
          .map((e) => Image(
                image: NetworkImage(e.image.toString()),
              ))
          .toList(),
      options: CarouselOptions(
        aspectRatio: 1.2,
        enlargeCenterPage: true,
        autoPlay: true,
        onPageChanged: (index, reason) {
          songList[index].id;
        },
      ),
    );
  }
}
