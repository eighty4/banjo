import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'display.dart';
import 'selection.dart';

double appHeaderPadding() {
  if (kIsWeb) {
    return 0;
  }
  if (Platform.isAndroid) {
    return 50;
  }
  if (Platform.isIOS) {
    return 35;
  }
  return 0;
}

void main() {
  runApp(BanjoTabsApp());
}

class BanjoTabsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
            data: MediaQueryData(),
            child: Container(
                padding: EdgeInsets.only(top: appHeaderPadding()),
                child: BanjoTabs())));
  }
}

class BanjoTabs extends StatefulWidget {
  @override
  State createState() {
    return BanjoTabsState();
  }
}

class BanjoTabsState extends State {
  String? songName;

  @override
  Widget build(BuildContext context) {
    if (songName == null) {
      return SongSelection((songName) => this.setState(() {
            this.songName = songName;
          }));
    } else {
      return SongDisplay(songName as String, () {
        this.setState(() {
          this.songName = null;
        });
      });
    }
  }
}
