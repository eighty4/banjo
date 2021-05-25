enum Chord { A, C, D, D7, F, G, Gm }

enum Finger { T, M, I }

class Note {
  final int string;
  final int fret;
  final bool melody;
  final Chord? chord;
  final int? hammerOn;
  final int? pullOff;
  final int? slideTo;
  final Finger? pick;
  final Note? and;

  Note(this.string, this.fret,
      {this.melody = false,
      this.chord,
      this.hammerOn,
      this.pullOff,
      this.slideTo,
      this.pick,
      this.and});
}

class Measure {
  final Chord? chord;
  final List<Note?> notes;
  final bool repeatStart;
  final bool repeatEnd;

  Measure(this.notes,
      {this.repeatStart = false, this.repeatEnd = false, this.chord});
}

class Song {
  final Chord chord;

  Song(this.measures, {this.chord = Chord.G});

  List<Measure> measures;
}

final hardAintItHard = Song([
  Measure([
    Note(3, 4, melody: true),
    Note(2, 0),
    Note(1, 0),
    Note(5, 0),
    Note(1, 0),
    Note(2, 0),
    Note(3, 2, melody: true),
    Note(1, 0)
  ]),
  Measure([
    Note(3, 0, melody: true),
    Note(2, 0),
    Note(5, 0),
    Note(1, 0),
    Note(3, 2, melody: true),
    Note(2, 0, melody: true),
    Note(1, 0),
    Note(5, 0)
  ]),
  Measure([
    Note(2, 1, melody: true),
    Note(1, 2),
    Note(5, 0),
    Note(2, 1),
    Note(1, 2),
    Note(5, 0),
    Note(2, 1),
    Note(1, 2)
  ], chord: Chord.C),
  Measure([
    Note(3, 0, melody: true),
    Note(2, 1),
    Note(1, 2),
    Note(5, 0),
    Note(1, 2),
    Note(2, 1),
    Note(3, 0),
    Note(1, 2)
  ], chord: Chord.C),
  Measure([
    Note(3, 4, melody: true),
    Note(2, 0),
    Note(1, 0),
    Note(5, 0),
    Note(1, 0),
    Note(2, 0),
    Note(3, 2, melody: true),
    Note(1, 0)
  ]),
  Measure([
    Note(3, 0, melody: true),
    Note(2, 0),
    Note(5, 0),
    Note(1, 0),
    Note(3, 2, melody: true),
    Note(2, 0, melody: true),
    Note(5, 0),
    Note(1, 0)
  ]),
  Measure([
    Note(3, 2, melody: true),
    Note(2, 1),
    Note(1, 0),
    Note(5, 0),
    Note(1, 0),
    Note(2, 1),
    Note(3, 2),
    Note(1, 0)
  ], chord: Chord.D7),
  Measure([
    Note(4, 0),
    Note(2, 1),
    Note(1, 0),
    Note(5, 0),
    Note(1, 0),
    Note(2, 1),
    Note(3, 2),
    Note(1, 0)
  ], chord: Chord.D7),
  Measure([
    Note(3, 4, melody: true),
    Note(2, 0),
    Note(1, 0),
    Note(5, 0),
    Note(1, 0),
    Note(2, 0),
    Note(3, 2, melody: true),
    Note(1, 0)
  ]),
  Measure([
    Note(3, 0, melody: true),
    Note(2, 0),
    Note(5, 0),
    Note(1, 0),
    Note(3, 2, melody: true),
    Note(2, 0, melody: true),
    Note(1, 0),
    Note(5, 0)
  ]),
  Measure([
    Note(2, 1, melody: true),
    Note(1, 2),
    Note(5, 0),
    Note(2, 1),
    Note(1, 2),
    Note(5, 0),
    Note(2, 1),
    Note(1, 2)
  ], chord: Chord.C),
  Measure([
    Note(3, 0),
    Note(2, 1),
    Note(1, 2),
    Note(5, 0),
    Note(1, 2),
    Note(2, 1),
    Note(3, 0),
    Note(1, 2)
  ], chord: Chord.C),
  Measure([
    Note(3, 4, melody: true),
    Note(2, 0),
    Note(1, 0),
    Note(5, 0),
    Note(1, 0),
    Note(2, 0),
    Note(3, 0, melody: true),
    Note(1, 0)
  ]),
  Measure([
    Note(3, 2, melody: true),
    Note(2, 1),
    Note(5, 0),
    Note(1, 0),
    Note(3, 4, melody: true),
    Note(2, 0),
    Note(3, 2, melody: true),
    Note(1, 0)
  ], chord: Chord.D7),
  Measure([
    Note(3, 0, melody: true),
    Note(2, 0),
    Note(1, 0),
    Note(5, 0),
    Note(1, 0),
    Note(2, 0),
    Note(3, 0),
    Note(1, 0)
  ]),
  Measure([Note(3, 0), null, Note(3, 0)])
]);

final goodNightLadies = Song([
  Measure([
    Note(3, 4, melody: true),
    Note(2, 0),
    Note(5, 0),
    Note(1, 0),
    Note(3, 0, melody: true),
    Note(2, 0),
    Note(5, 0),
    Note(1, 0)
  ]),
  Measure([
    Note(4, 0, melody: true),
    Note(2, 0),
    Note(3, 0, melody: true),
    Note(1, 0),
    Note(5, 0),
    Note(2, 0),
    Note(3, 0),
    Note(1, 0)
  ]),
  Measure([
    Note(3, 4, melody: true),
    Note(2, 0),
    Note(5, 0),
    Note(1, 0),
    Note(3, 0, melody: true),
    Note(2, 0),
    Note(5, 0),
    Note(1, 0)
  ]),
  Measure([
    Note(3, 2, melody: true),
    Note(2, 1),
    Note(3, 2, melody: true),
    Note(1, 0),
    Note(5, 0),
    Note(2, 1),
    Note(4, 0),
    Note(1, 0)
  ], chord: Chord.D7),
  Measure([
    Note(3, 4, melody: true),
    Note(2, 0),
    Note(5, 0),
    Note(1, 0),
    Note(3, 0, melody: true),
    Note(2, 0),
    Note(5, 0),
    Note(1, 0)
  ]),
  Measure([
    Note(3, 5, melody: true),
    Note(2, 5),
    Note(3, 5, melody: true),
    Note(1, 0),
    Note(5, 0),
    Note(2, 5),
    Note(3, 5),
    Note(1, 0)
  ], chord: Chord.C),
  Measure([
    Note(3, 4, melody: true),
    Note(2, 3),
    Note(5, 0),
    Note(1, 0),
    Note(3, 2, chord: Chord.D7, melody: true),
    Note(2, 1, chord: Chord.D7),
    Note(5, 0),
    Note(1, 0)
  ]),
  Measure([
    Note(3, 0, melody: true),
    Note(2, 0),
    Note(5, 0),
    Note(1, 0),
    Note(3, 0),
    null,
    Note(3, 0)
  ]),
]);

final littleMaggie = Song([
  Measure([
    Note(3, 2, slideTo: 3),
    null,
    Note(2, 0),
    null,
    Note(5, 0),
    null,
    Note(1, 0),
    null
  ]),
  Measure([
    Note(3, 0),
    Note(1, 0),
    Note(4, 4, slideTo: 5),
    Note(3, 0),
    Note(1, 0),
    Note(5, 0),
    Note(3, 0),
    Note(1, 0)
  ]),
  Measure([
    Note(2, 2, hammerOn: 3),
    Note(1, 0),
    Note(2, 2, hammerOn: 3),
    Note(1, 0),
    Note(5, 0),
    Note(2, 0),
    Note(1, 0),
    Note(5, 0)
  ]),
  Measure([
    Note(3, 2),
    Note(1, 3),
    Note(4, 3),
    Note(3, 2),
    Note(1, 3),
    Note(3, 2),
    Note(4, 3),
    Note(1, 3)
  ]),
  Measure([
    Note(3, 0, hammerOn: 2),
    Note(2, 1),
    Note(1, 3),
    Note(5, 0),
    Note(1, 3),
    Note(3, 2),
    Note(4, 3),
    Note(1, 3)
  ]),
  Measure([
    Note(3, 0),
    Note(1, 0),
    Note(5, 0),
    Note(3, 0),
    Note(1, 0),
    Note(5, 0),
    Note(3, 0),
    Note(1, 0)
  ]),
  Measure([
    Note(2, 2, hammerOn: 3),
    Note(1, 0),
    Note(2, 2, hammerOn: 3),
    Note(1, 0),
    Note(5, 0),
    Note(3, 3, pullOff: 2),
    Note(1, 0),
    Note(5, 0)
  ]),
]);

final darkHollow = Song([
  Measure([
    Note(1, 12),
    null,
    Note(3, 11),
    Note(3, 11),
    Note(1, 12, and: Note(2, 10)),
    null,
    Note(1, 14, and: Note(2, 14))
  ]),
]);

final banksOfTheOhio = Song([
  Measure([
    Note(1, 15, and: Note(2, 15)),
    null,
    Note(1, 12, and: Note(2, 12, and: Note(3, 10))),
    Note(1, 12, and: Note(2, 12, and: Note(3, 10))),
    Note(1, 12, and: Note(2, 12, and: Note(3, 10))),
    Note(1, 12, and: Note(2, 12, and: Note(3, 10))),
    null,
    Note(1, 10, and: Note(2, 10, and: Note(3, 8)))
  ])
]);

final pigInAPen = Song([
  Measure([null, null, Note(4, 0), null, Note(4, 2), null, Note(4, 4), null]),
  Measure([
    Note(3, 0),
    Note(1, 0, and: Note(5, 0)),
    null,
    Note(3, 2, slideTo: 4),
    Note(3, 0),
    Note(1, 0, and: Note(5, 0)),
    null,
    Note(3, 2, slideTo: 4)
  ])
]);

final songs = {
  "Banks of the Ohio": banksOfTheOhio,
  "Dark Hollow": darkHollow,
  "Good Night Ladies": goodNightLadies,
  "Hard, Ain't It Hard": hardAintItHard,
  "Little Maggie": littleMaggie,
};

// todo beams
// todo rests
