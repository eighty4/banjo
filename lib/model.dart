enum Chord {
  G, C, D7, F, D, Gm, A
}

enum Finger {
  T, M, I
}

class Note {
  final int string;
  String fret;
  final Chord chord;
  final int hammerOn;
  final int pullOff;
  final int slideTo;
  final Finger pick;
  Note(this.string, int fret, {this.chord, this.hammerOn, this.pullOff, this.slideTo, this.pick}) {
    this.fret = fret.toString();
  }
}

class Measure {
  final Chord chord;
  final List<Note> notes;
  final bool repeatStart;
  final bool repeatEnd;
  Measure(this.notes, {this.repeatStart = false, this.repeatEnd = false, this.chord});
}

class Song {
  final Chord chord;
  Song(this.measures, {this.chord = Chord.G});
  List<Measure> measures;
}

final hardAintItHard = Song([
  Measure([Note(3, 4), Note(2, 0), Note(1, 0), Note(5, 0), Note(1, 0), Note(2, 0), Note(3, 2), Note(1, 0)]),
  Measure([Note(3, 0), Note(2, 0), Note(5, 0), Note(1, 0), Note(3, 2), Note(2, 0), Note(1, 0), Note(5, 0)]),
  Measure([Note(2, 1), Note(1, 2), Note(5, 0), Note(2, 1), Note(1, 2), Note(5, 0), Note(2, 1), Note(1, 2)], chord: Chord.C),
  Measure([Note(3, 0), Note(2, 1), Note(1, 2), Note(5, 0), Note(1, 2), Note(2, 1), Note(3, 0), Note(1, 2)], chord: Chord.C),

  Measure([Note(3, 4), Note(2, 0), Note(1, 0), Note(5, 0), Note(1, 0), Note(2, 0), Note(3, 2), Note(1, 0)]),
  Measure([Note(3, 0), Note(2, 0), Note(5, 0), Note(1, 0), Note(3, 2), Note(2, 0), Note(5, 0), Note(1, 0)]),
  Measure([Note(3, 2), Note(2, 1), Note(1, 0), Note(5, 0), Note(1, 0), Note(2, 1), Note(3, 2), Note(1, 0)], chord: Chord.D7),
  Measure([Note(4, 0), Note(2, 1), Note(1, 0), Note(5, 0), Note(1, 0), Note(2, 1), Note(3, 2), Note(1, 0)], chord: Chord.D7),

  Measure([Note(3, 4), Note(2, 0), Note(1, 0), Note(5, 0), Note(1, 0), Note(2, 0), Note(3, 2), Note(1, 0)]),
  Measure([Note(3, 0), Note(2, 0), Note(5, 0), Note(1, 0), Note(3, 2), Note(2, 0), Note(1, 0), Note(5, 0)]),
  Measure([Note(2, 1), Note(1, 2), Note(5, 0), Note(2, 1), Note(1, 2), Note(5, 0), Note(2, 1), Note(1, 2)], chord: Chord.C),
  Measure([Note(3, 0), Note(2, 1), Note(1, 2), Note(5, 0), Note(1, 2), Note(2, 1), Note(3, 0), Note(1, 2)], chord: Chord.C),

  Measure([Note(3, 4), Note(2, 0), Note(1, 0), Note(5, 0), Note(1, 0), Note(2, 0), Note(3, 0), Note(1, 0)]),
  Measure([Note(3, 2), Note(2, 1), Note(5, 0), Note(1, 0), Note(3, 4), Note(2, 0), Note(3, 2), Note(1, 0)], chord: Chord.D7),
  Measure([Note(3, 0), Note(2, 0), Note(1, 0), Note(5, 0), Note(1, 0), Note(2, 0), Note(3, 0), Note(1, 0)]),
  Measure([Note(3, 0), null, Note(3, 0)])
]);

final goodNightLadies = Song([
  Measure([Note(3, 4), Note(2, 0), Note(5, 0), Note(1, 0), Note(3, 0), Note(2, 0), Note(5, 0), Note(1, 0)]),
  Measure([Note(4, 0), Note(2, 0), Note(3, 0), Note(1, 0), Note(5, 0), Note(2, 0), Note(3, 0), Note(1, 0)]),
  Measure([Note(3, 4), Note(2, 0), Note(5, 0), Note(1, 0), Note(3, 0), Note(2, 0), Note(5, 0), Note(1, 0)]),
  Measure([Note(3, 2), Note(2, 1), Note(3, 2), Note(1, 0), Note(5, 0), Note(2, 1), Note(4, 0), Note(1, 0)], chord: Chord.D7),

  Measure([Note(3, 4), Note(2, 0), Note(5, 0), Note(1, 0), Note(3, 0), Note(2, 0), Note(5, 0), Note(1, 0)]),
  Measure([Note(3, 5), Note(2, 5), Note(3, 5), Note(1, 0), Note(5, 0), Note(2, 5), Note(3, 5), Note(1, 0)], chord: Chord.C),
  Measure([Note(3, 4), Note(2, 3), Note(5, 0), Note(1, 0), Note(3, 2, chord: Chord.D7), Note(2, 1, chord: Chord.D7), Note(5, 0), Note(1, 0)]),
  Measure([Note(3, 0), Note(2, 0), Note(5, 0), Note(1, 0), Note(3, 0), null, Note(3, 0)]),
]);

final littleMaggie = Song([
  Measure([Note(3, 2, slideTo: 3), null, Note(2, 0), null, Note(5, 0), null, Note(1, 0), null]),
  Measure([Note(3, 0), Note(1, 0), Note(4, 4, slideTo: 5), Note(3, 0), Note(1, 0), Note(5, 0), Note(3, 0), Note(1, 0)]),
  Measure([Note(2, 2, hammerOn: 3), Note(1, 0), Note(2, 2, hammerOn: 3), Note(1, 0), Note(5, 0), Note(2, 0), Note(1, 0), Note(5, 0)]),
  Measure([Note(3, 2), Note(1, 3), Note(4, 3), Note(3, 2), Note(1, 3), Note(3, 2), Note(4, 3), Note(1, 3)]),

  Measure([Note(3, 0, hammerOn: 2), Note(2, 1), Note(1, 3), Note(5, 0), Note(1, 3), Note(3, 2), Note(4, 3), Note(1, 3)]),
  Measure([Note(3, 0), Note(1, 0), Note(5, 0), Note(3, 0), Note(1, 0), Note(5, 0), Note(3, 0), Note(1, 0)]),
  Measure([Note(2, 2, hammerOn: 3), Note(1, 0), Note(2, 2, hammerOn: 3), Note(1, 0), Note(5, 0), Note(3, 3, pullOff: 2), Note(1, 0), Note(5, 0)]),
]);

// todo slides
// todo pull offs
// todo hammer ons
// todo boom-chiks
// todo melody
// todo beams
// todo rests
