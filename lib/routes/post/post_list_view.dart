import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  // use dummy page that says "PostListView" for now
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    // return scaffold with a list view of posts
    return Scaffold(
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Post $index'),
                onTap: () {
                  // navigate to PostDetailedView
                },
              );
            },
          ),
        );

  }

}