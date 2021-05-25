import 'package:flutter/material.dart';

import 'display.dart';
import 'model.dart';

class SongButton extends StatelessWidget {
  final String songName;

  SongButton(this.songName);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () {
              print('selected song ' + songName);
              Navigator.pushNamed(context,
                  '${SongDisplayArguments.routeName}?songName=$songName',
                  arguments: SongDisplayArguments(songName));
            },
            child: Container(
                padding: EdgeInsets.all(15),
                child: Text(songName, style: TextStyle(fontSize: 26)))));
  }
}

class SongSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Center(child: Text('Songs', style: TextStyle(fontSize: 30))),
            ...songs.keys.map((songName) => SongButton(songName)).toList()
          ],
        ));
  }
}
