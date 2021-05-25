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

    return Container(
        color: Colors.black,
        padding: EdgeInsets.only(top: appHeaderPadding()),
        child: WidgetsApp(
          color: Color.fromARGB(255, 153, 101, 21),
          textStyle: TextStyle(color: Colors.white),
          home: SongSelection(),
          onGenerateRoute: (settings) {
            if (settings.name != null &&
                settings.name!.startsWith(SongDisplayArguments.routeName)) {
              var songName;
              if (settings.arguments != null) {
                final arguments = settings.arguments as SongDisplayArguments;
                songName = arguments.songName;
              } else {
                final displayShowUri = Uri.parse(settings.name!);
                songName = displayShowUri.queryParameters['songName'];
              }
              if (songName != null) {
                return MaterialPageRoute(
                    builder: (context) => SongDisplayScreen(),
                    fullscreenDialog: true,
                    settings: RouteSettings(
                        name: settings.name!,
                        arguments: SongDisplayArguments(songName)));
              }
            }
            return null;
          },
          pageRouteBuilder: <T>(settings, builder) {
            return MaterialPageRoute(
                builder: builder, fullscreenDialog: true, settings: settings);
          },
          routes: {},
          title: 'Banjo Tabs',
        ));
  }
}
