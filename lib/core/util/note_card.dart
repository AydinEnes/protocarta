import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/routes/note/bloc/note_bloc.dart';

import '../../models/note.dart';
import '../../navigation/app_router.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      buildWhen: (previous, current) {
        return current.allNotes.containsKey(id) &&
            (!previous.allNotes.containsKey(id) ||
                previous.allNotes[id] != current.allNotes[id]);
      },
      builder: (context, state) {
        // debugPrint('building a note: $id ${state.allNotes.containsKey(id)}');
        final notes = Map<int, Note>.from(state.allNotes);
        final displayNote = notes.putIfAbsent(id, () => Note.empty());
        return Card(
          color: Colors.white.withOpacity(0.7),
          child: GestureDetector(
            onTap: () => context.router.push(NoteDetailedRoute(
                note: displayNote, noteBloc: context.read<NoteBloc>())),
            child: Container(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(displayNote.text),
                  IconButton(
                    icon: Icon(
                      Icons.bookmark,
                      color: displayNote.saved ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      context.read<NoteBloc>().add(SaveNoteEvent(displayNote));
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
