import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/models/note.dart';
import 'package:protocarta/routes/note/bloc/note_bloc.dart';

class NoteDetailedView extends StatelessWidget {
  // use dummy page that says "NoteDetailedView" for now
  const NoteDetailedView({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        buildWhen: (previous, current) {
          return current.allNotes.containsKey(note.id) &&
              (!previous.allNotes.containsKey(note.id) ||
                  previous.allNotes[note.id] != current.allNotes[note.id]);
        },
        builder: (context, state) {
          Map<int, Note> notes = Map.from(state.allNotes);
          Note displayNote = notes.putIfAbsent(note.id, () => note);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Note ${displayNote.id}'),
                Text(displayNote.text),
                IconButton(
                  icon: Icon(
                    Icons.bookmark,
                    color: displayNote.saved ? Colors.black : Colors.grey,
                  ),
                  onPressed: () {
                    debugPrint('save note ${displayNote.id} pressed');
                    context.read<NoteBloc>().add(SaveNoteEvent(displayNote));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
