import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:notes/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SongTabs(littleMaggie);
  }
}

class SongTabs extends StatefulWidget {
  final Song song;
  SongTabs(this.song);

  @override
  State<StatefulWidget> createState() => SongPracticeState(this.song);
}

class SongPracticeState extends State<SongTabs> {
  static const double PADDING = 5;
  final Song song;
  SongPracticeState(this.song);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      textDirection: TextDirection.ltr,
      children: this.buildRows(),
    );
  }

  List<Widget> buildRows() {
    List<Widget> rows = [];
    rows.add(SizedBox(height: PADDING));
    for (var i = 0; i < this.song.measures.length; i = i + 2) {
      if (i + 1 >= this.song.measures.length) {
        rows.add(this.buildRow(this.song.measures[i], null));
      } else {
        rows.add(this.buildRow(this.song.measures[i], this.song.measures[i + 1], last: i + 2 == this.song.measures.length));
      }
      rows.add(SizedBox(height: PADDING));
    }
    return rows;
  }

  Widget buildRow(Measure measure, Measure measure2, {last = false}) {
    return Expanded(
        child: Row(textDirection: TextDirection.ltr, children: [
          SizedBox(width: PADDING),
          Expanded(child: MeasureDisplay(measure, measure2 == null)),
          SizedBox(width: PADDING),
          Expanded(child: measure2 == null ? SizedBox() : MeasureDisplay(measure2, last)),
          SizedBox(width: PADDING),
        ]));
  }
}

class MeasureDisplay extends Container {
  MeasureDisplay(Measure measure, bool last)
      : super(
      color: Colors.white,
      height: 200,
      width: 550,
      child: CustomPaint(painter: MeasurePainter(measure, last)));
}

class MeasurePainter extends CustomPainter {
  static const STRINGS_COLOR = Colors.blueGrey;
  static const NOTES_COLOR = Colors.black;
  static const double REPEAT_BAR_WIDTH = 6;
  static const double REPEAT_BAR_OFFSET = REPEAT_BAR_WIDTH / 2;
  static const double REPEAT_LINE_OFFSET = REPEAT_BAR_WIDTH + REPEAT_BAR_OFFSET;
  static const double REPEAT_LINE_WIDTH = 1;
  static const double REPEAT_CIRCLE_OFFSET = 13;
  final Measure measure;
  final bool last;
  MeasurePainter(this.measure, this.last);

  @override
  void paint(Canvas canvas, Size size) {
    final ySpace = size.height / 6;
    paintStrings(canvas, size, ySpace);
    paintNotes(canvas, size, ySpace);

    if (measure.repeatStart) {
      paintRepeatLine(canvas, size, false, REPEAT_BAR_OFFSET, REPEAT_BAR_WIDTH);
      paintRepeatLine(canvas, size, false, REPEAT_LINE_OFFSET, REPEAT_LINE_WIDTH);
      paintRepeatDots(canvas, size, false);
    } else if (measure.repeatEnd) {
      paintRepeatLine(canvas, size, true, REPEAT_BAR_OFFSET, REPEAT_BAR_WIDTH);
      paintRepeatLine(canvas, size, true, REPEAT_LINE_OFFSET, REPEAT_LINE_WIDTH);
      paintRepeatDots(canvas, size, true);
    } else if (last) {
      paintRepeatLine(canvas, size, true, REPEAT_BAR_OFFSET, REPEAT_BAR_WIDTH);
      paintRepeatLine(canvas, size, true, REPEAT_LINE_OFFSET, REPEAT_LINE_WIDTH);
    }
  }

  void paintRepeatLine(Canvas canvas, Size size, bool end, double offset, double width) {
    var paint = Paint();
    paint.color = STRINGS_COLOR;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = width;
    var path = Path();
    double lineOffset = end ? size.width - offset : offset;
    path.moveTo(lineOffset, 0);
    path.lineTo(lineOffset, size.height);
    canvas.drawPath(path, paint);
  }

  void paintRepeatDots(Canvas canvas, Size size, bool end) {
    var paint = Paint()..color = STRINGS_COLOR;
    var xOffset = end ? size.width - REPEAT_CIRCLE_OFFSET : REPEAT_CIRCLE_OFFSET;
    var yOffset = size.height / 6;
    canvas.drawCircle(Offset(xOffset, yOffset * 1.5), 2, paint);
    canvas.drawCircle(Offset(xOffset, yOffset * 4.5), 2, paint);
  }

  void paintNotes(Canvas canvas, Size size, double ySpace) {
    var xSpace = size.width / 9;
    measure.notes.asMap().forEach((i, note) {
      if (note == null) {
        return;
      }
      //      path.moveTo((i + 1) * xSpace, 0); // debug
      //      path.lineTo((i + 1) * xSpace, size.height); // debug
      final textStyle = TextStyle(
          color: NOTES_COLOR,
          fontSize: 24
      );
      final textSpan = TextSpan(text: note.fret,
          style: textStyle
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      );
      textPainter.layout(
        minWidth: 30,
        maxWidth: size.width,
      );
      final offset = Offset(((i + 1) * xSpace) - 15, ySpace * note.string - 14);
      textPainter.paint(canvas, offset);

      if (note.slideTo != null) {

      }

      if (note.hammerOn != null) {

      }

      if (note.pullOff != null) {

      }
    });
  }

  void paintStrings(Canvas canvas, Size size, num ySpace) {
    var paint = Paint();
    paint.color = STRINGS_COLOR;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;

    var path = Path();
    for (var i = 1; i < 6; i++) {
      var y = ySpace * i;
      path.moveTo(0, y);
      path.lineTo(size.width, y);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
