class Song {
  final String id;
  final String name;
  final String singer;
  final String image;
  final String music;

  Song({
    required this.id,
    required this.name,
    required this.singer,
    required this.image,
    required this.music,
  });
}

List<Song> db = [
  Song(
      id: "1",
      singer: "Joji",
      name: "Yeah Right",
      image:
          "https://images.genius.com/d3febc6500693580ce28af59f314e631.720x720x1.png",
      music: "lib/assets/musics/Yeah Right.mp3"),
  Song(
      id: "2",
      singer: "Arctic Monkeys",
      name: "Whyd You Only Call Me When Youre High",
      image: "https://i.scdn.co/image/ab67616d0000b2734ae1c4c5c45aabe565499163",
      music: "assets/musics/Whyd You Only Call Me When Youre High.mp3"),
  Song(
      id: "3",
      singer: "Kahraman Deniz",
      name: "Son Durağın",
      image: "https://i.scdn.co/image/ab67616d0000b273057be6a5c6af27b6b35cfec3",
      music: "assets/musics/Son Durağın.mp3"),
  Song(
      id: "4",
      singer: "Duman",
      name: "Öyle Dertli",
      image: "https://upload.wikimedia.org/wikipedia/tr/4/47/Darmaduman.jpg",
      music: "assets/musics/Öyle Dertli.mp3"),
  Song(
      id: "5",
      singer: "The Shipp of Fools",
      name: "Party Tonight",
      image:
          "https://lastfm.freetls.fastly.net/i/u/300x300/e238ceea0b683f2617a64d811155ed99.jpg",
      music: "assets/musics/Party Tonight.mp3"),
  Song(
      id: "6",
      singer: "Joji",
      name: "Ew",
      image:
          "https://images.genius.com/d3febc6500693580ce28af59f314e631.720x720x1.png",
      music: "assets/musics/Ew.mp3"),
  Song(
      id: "7",
      singer: "Yüzyüzeyken Konuşuruz",
      name: "Dinle Beni Bi",
      image: "https://i.scdn.co/image/ab67616d0000b2732de642b64eadaeff4697f156",
      music: "assets/musics/Dinle Beni Bi.mp3"),
  Song(
      id: "8",
      singer: "The Weeknd",
      name: "After Hours",
      image:
          "https://upload.wikimedia.org/wikipedia/tr/c/c1/The_Weeknd_-_After_Hours.png",
      music: "assets/musics/After Hours.mp3"),
  Song(
      id: "9",
      singer: "Arctic Monkeys",
      name: "Do I Wanna Know",
      image: "https://i.scdn.co/image/ab67616d0000b2734ae1c4c5c45aabe565499163",
      music: "assets/musics/Do I Wanna Know.mp3"),
  Song(
      id: "10",
      singer: "Duman",
      name: "Aman Aman",
      image: "https://i.scdn.co/image/ab67616d0000b2730c8ac83035e9588e8ad34b90",
      music: "assets/musics/Aman Aman.mp3"),
  Song(
      id: "11",
      singer: "Tame Impala",
      name: "The Less I Know The Better",
      image: "https://i.scdn.co/image/ab67616d0000b2739e1cfc756886ac782e363d79",
      music: "assets/musics/The Less I Know The Better.mp3"),
  Song(
      id: "12",
      singer: "Joji",
      name: "Afterthought",
      image: "https://i.scdn.co/image/ab67616d00001e024896429a87abfacd5d90587b",
      music: "assets/musics/Yeah Right.mp3"),
  Song(
      id: "13",
      singer: "Childish Gambino",
      name: "Redbone",
      image: "https://i.scdn.co/image/ab67616d0000b273f78c98bbf2b3c9e2a764203e",
      music: "assets/musics/Redbone.mp3"),
];
