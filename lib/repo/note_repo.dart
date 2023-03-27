
import '../models/note.dart';
import 'package:rxdart/rxdart.dart';

class NoteRepository {
  NoteRepository();

  // Note stream
  late final BehaviorSubject<Set<Note>> allNotes =
  BehaviorSubject<Set<Note>>.seeded({});

  Stream<Set<Note>> get getNoteStream => allNotes.asBroadcastStream();

  // fetch pre-defined notes with Note model objects
  Future<List<Note>> fetchNotes() async {
    await Future.delayed(const Duration(seconds: 1));
    List<Note> dumList = [
      const Note(
        saved: true,
        text: 'Note AAA',
        postId: 1,
        id: 1,
      ),
      const Note(
        saved: false,
        text: 'Note BBB',
        postId: 2,
        id: 2,
      ),
      const Note(
        saved: true,
        text: 'Note 3',
        postId: 3,
        id: 3,
      ),
      const Note(
        saved: false,
        text: 'Note 4',
        postId: 4,
        id: 4,
      ),
      const Note(
        saved: true,
        text: 'Note 5',
        postId: 5,
        id: 5,
      ),
      const Note(
        saved: false,
        text: 'Note 6',
        postId: 6,
        id: 6,
      ),
      const Note(
        saved: true,
        text: 'Note 7',
        postId: 7,
        id: 7,
      ),
      const Note(
        saved: false,
        text: 'Note 8',
        postId: 8,
        id: 8,
      ),
      const Note(
        saved: true,
        text: 'Note 9',
        postId: 9,
        id: 9,
      ),
      const Note(
        saved: false,
        text: 'Note 10',
        postId: 10,
        id: 10,
      ),
    ];

    Set<Note> noteSet = allNotes.value;

    for (Note note in dumList) {
      noteSet.removeWhere((element) => element.id == note.id);
      noteSet.add(note);
    }

    allNotes.add(noteSet);

    return dumList;
  }

  // make note in the stream saved field true
  void saveNoteStream(int id, String text, int postId, bool saved) {
    Set<Note> noteSet = allNotes.value;
    noteSet.removeWhere((element) => element.id == id);
    if(saved == false) {
      noteSet.add(Note(
        saved: true,
        text: text,
        postId: postId,
        id: id,
      ));
    }
    else {
      noteSet.add(Note(
        saved: false,
        text: text,
        postId: postId,
        id: id,
      ));
    }
    allNotes.add(noteSet);
  }

}