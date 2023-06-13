import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../database.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Song> displayList = List.from(db);
  void updateList(String value) {
    setState(() {
      displayList = db
          .where((element) => element.name!.toLowerCase().contains(
                value.toLowerCase(),
              ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Ara",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) => updateList(value),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Ne Dinlemek İstersin?",
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: displayList.length == 0
                      ? Center(
                          child: Text(
                            "Sonuç Bulunamadı",
                            style: GoogleFonts.nunito(
                                color: Colors.white.withOpacity(.6),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      : ListView.builder(
                          itemCount: displayList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                title: Text(
                                  displayList[index].name,
                                  style: GoogleFonts.nunito(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  displayList[index].singer,
                                  style: GoogleFonts.nunito(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white.withOpacity(.6)),
                                ),
                                trailing: IconButton(
                                  onPressed: () {},
                                  iconSize: 32,
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: Colors.white.withOpacity(.6),
                                  ),
                                ),
                                leading: Image(
                                  image: NetworkImage(displayList[index].image),
                                ),
                              ),
                            );
                          },
                        ),
                )
              ],
            )),
      ),
    );
  }
}
