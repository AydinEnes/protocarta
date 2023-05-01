import '../models/note.dart';
import 'package:rxdart/rxdart.dart';

class NoteRepository {
  NoteRepository();

  // Note stream
  late final BehaviorSubject<Map<int,Note>> allNotes =
      BehaviorSubject<Map<int,Note>>.seeded({});

  Stream<Map<int,Note>> get getNoteStream => allNotes.asBroadcastStream();

  // fetch pre-defined notes with Note model objects
  Future<List<Note>> fetchNotes() async {
    await Future.delayed(const Duration(seconds: 1));
    List<Note> dumList = [
      const Note(
        saved: true,
        text: 'This is first note',
        postId: 1,
        id: 1,
      ),
      const Note(
        saved: false,
        text: 'This is second note',
        postId: 2,
        id: 2,
      ),
      const Note(
        saved: false,
        text: 'This is third note',
        postId: 3,
        id: 3,
      ),
      const Note(
        saved: false,
        text: 'This is fourth note',
        postId: 4,
        id: 4,
      ),
      const Note(
        saved: false,
        text: 'This is fifth note',
        postId: 5,
        id: 5,
      ),
      const Note(
        saved: false,
        text: 'This is sixth note',
        postId: 6,
        id: 6,
      ),
      const Note(
        saved: false,
        text: 'This is seventh note',
        postId: 7,
        id: 7,
      ),
      const Note(
        saved: false,
        text: 'This is eighth note',
        postId: 8,
        id: 8,
      ),
      const Note(
        saved: false,
        text: 'This is ninth note',
        postId: 9,
        id: 9,
      ),
      const Note(
        saved: false,
        text: 'This is tenth note',
        postId: 10,
        id: 10,
      ),
    ];

    Map<int,Note> noteSet = allNotes.value;

    for (Note note in dumList) {
      noteSet[note.id] = note;
    }

    allNotes.add(noteSet);

    return dumList;
  }

  // make note in the stream saved field true
  Future<Note> saveNoteStream(Note note) async {
    updateNoteStream([note.copyWith(saved: !note.saved)]);
    return note;
  }

  void updateNoteStream(List<Note> noteList) {
    Map<int,Note> noteSet = allNotes.value;
    for (Note note in noteList) {
      noteSet[note.id] = note;
    }
    allNotes.add(noteSet);
  }

  Future<Note> addNoteStream(Note note) async {
    Map<int,Note> noteSet = allNotes.value;
    noteSet[note.id] = note;
    allNotes.add(noteSet);
    return note;
  }
}
