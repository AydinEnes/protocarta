
import '../models/note.dart';

class NoteRepository {
  NoteRepository();

  // fetch pre-defined notes with Note model objects
  Future<List<Note>> fetchNotes() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
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
  }
}