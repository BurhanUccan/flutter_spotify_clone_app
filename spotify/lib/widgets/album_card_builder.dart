import 'package:flutter/material.dart';
import 'package:spotify/database.dart';
import 'package:spotify/widgets/album_card.dart';

class CardBuilder extends StatefulWidget {
  const CardBuilder({super.key});

  @override
  State<CardBuilder> createState() => _CardBuilderState();
}

class _CardBuilderState extends State<CardBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              albumCard(
                  image: NetworkImage(db[index].image.toString()),
                  label: db[index].name.toString()),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        );
      },
    );
  }
}
