import 'package:flutter/material.dart';

import 'model.dart';

class SongButton extends StatelessWidget {
  final String songName;
  final Function(String) selectSong;

  SongButton(this.songName, this.selectSong);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () {
              print('selected song ' + songName);
              selectSong(songName);
            },
            child: Container(
                padding: EdgeInsets.all(15),
                child: Text(songName, style: TextStyle(fontSize: 26)))));
  }
}

class SongSelection extends StatelessWidget {
  final Function(String) selectSong;

  SongSelection(this.selectSong);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                    child: Text('Songs', style: TextStyle(fontSize: 30)))),
            ...songs.keys
                .map((songName) => SongButton(songName, selectSong))
                .toList()
          ],
        ));
  }
}
