

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protocarta/core/util/note_card.dart';
import 'package:protocarta/models/post.dart';
import 'package:protocarta/routes/note/bloc/note_bloc.dart';
import 'package:protocarta/routes/post/bloc/post_bloc.dart';

import '../../models/note.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(post.ownerName),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: NoteCard(
                  note: post.note,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: post.liked ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  context.read<PostBloc>().add(LikePostEvent(post));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

}