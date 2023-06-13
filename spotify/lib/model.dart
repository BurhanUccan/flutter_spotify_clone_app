// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MusicModel welcomeFromJson(String str) => MusicModel.fromJson(json.decode(str));

String welcomeToJson(MusicModel data) => json.encode(data.toJson());

class MusicModel {
  String? id;
  String? singer;
  String? name;
  String? image;
  String? music;

  MusicModel({
    this.id,
    this.singer,
    this.name,
    this.image,
    this.music,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) => MusicModel(
        id: json["id"],
        singer: json["singer"],
        name: json["name"],
        image: json["image"],
        music: json["music"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "singer": singer,
        "name": name,
        "image": image,
        "music": music,
      };
}
