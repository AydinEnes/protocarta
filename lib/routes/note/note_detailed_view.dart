import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/models/note.dart';
import 'package:protocarta/repo/note_repo.dart';
import 'package:protocarta/repo/post_repo.dart';
import 'package:protocarta/routes/note/bloc/note_bloc.dart';

class NoteDetailedView extends StatelessWidget {
  // use dummy page that says "NoteDetailedView" for now
  const NoteDetailedView({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
      ),
      body: BlocProvider(
        create: (BuildContext context) =>
        NoteBloc(
          noteRepository: RepositoryProvider.of<NoteRepository>(context),
          postRepository: RepositoryProvider.of<PostRepository>(context),
        )..add(FetchNoteEvent(note))
          ..add(SubscribeToNoteEvent(note.id)),
        child: BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            Note displayNote = Note(
              id: state.id,
              text: state.text,
              saved: state.saved,
              postId: state.postId,
            );
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
      ),
    );
  }

}