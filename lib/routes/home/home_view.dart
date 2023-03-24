import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:protocarta/navigation/app_router.dart';
import 'package:protocarta/routes/note/note_list_view.dart';
import 'package:protocarta/routes/post/post_list_view.dart';

class HomeView extends StatelessWidget {
  @override
  // there should be an AppBar, BottomNavigationBar, and tabs for posts and notes list views
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Home'),
      ),
      bottomNavigationBar:
          // this is the bottom navigation
          BottomNavigationBar( // this is the bottom navigation
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notes',
          ),

          ]
      ),
    );
  }
} // HomeView


