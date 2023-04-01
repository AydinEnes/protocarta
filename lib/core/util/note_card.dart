

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/routes/note/bloc/note_bloc.dart';

import '../../models/note.dart';
import '../../navigation/app_router.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          context.router.push(NoteDetailedRoute(note: note));
        },
        child: Container(
          color: Colors.lightBlue,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(note.text),
              IconButton(
                icon: Icon(
                    Icons.bookmark,
                    color: note.saved ? Colors.black : Colors.grey,
                ),
                onPressed: () {
                  context.read<NoteBloc>().add(SaveNoteEvent(note));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}