class Images {
  final String name;
  final String adress;

  Images({required this.adress, required this.name});
}

List<Images> db_images = [
  Images(
      name: "LikedSongs",
      adress: "https://misc.scdn.co/liked-songs/liked-songs-300.png")
];
