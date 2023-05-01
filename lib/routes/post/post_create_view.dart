import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCreateView extends StatelessWidget {
  // use dummy page that says "PostDetailedView" for now
  const PostCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: const Center(child: Text('PostCreateView')),
    );
  }
}
