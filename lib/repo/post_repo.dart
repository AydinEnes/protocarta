

import 'package:protocarta/models/post.dart';
import 'package:rxdart/rxdart.dart';

import '../models/note.dart';

class PostRepository{
  PostRepository();

  late final BehaviorSubject<Set<Post>> allPosts =
  BehaviorSubject<Set<Post>>.seeded({});

  Stream<Set<Post>> get getPostStream => allPosts.asBroadcastStream();

  // fetch pre-defined posts with Post model objects
  Future<List<Post>> fetchPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    List<Post> dumList = [
      const Post(
        ownerName: 'Owner AAA',
        liked: true,
        note: Note(
          saved: true,
          text: 'Note 1',
          postId: 1,
          id: 1,
        ),
        id: 1,
      ),
      const Post(
        ownerName: 'Owner BBB',
        liked: false,
        note: Note(
          saved: false,
          text: 'Note 2',
          postId: 2,
          id: 2,
        ),
        id: 2,
      ),
      const Post(
        ownerName: 'Owner 3',
        liked: true,
        note: Note(
          saved: true,
          text: 'Note 3',
          postId: 3,
          id: 3,
        ),
        id: 3,
      ),
      const Post(
        ownerName: 'Owner 4',
        liked: false,
        note: Note(
          saved: false,
          text: 'Note 4',
          postId: 4,
          id: 4,
        ),
        id: 4,
      ),
      const Post(
        ownerName: 'Owner 5',
        liked: true,
        note: Note(
          saved: true,
          text: 'Note 5',
          postId: 5,
          id: 5,
        ),
        id: 5,
      ),
      const Post(
        ownerName: 'Owner 6',
        liked: false,
        note: Note(
          saved: false,
          text: 'Note 6',
          postId: 6,
          id: 6,
        ),
        id: 6,
      ),
      const Post(
        ownerName: 'Owner 7',
        liked: true,
        note: Note(
          saved: true,
          text: 'Note 7',
          postId: 7,
          id: 7,
        ),
        id: 7,
      ),
      const Post(
        ownerName: 'Owner 8',
        liked: false,
        note: Note(
          saved: false,
          text: 'Note 8',
          postId: 8,
          id: 8,
        ),
        id: 8,
      ),
      const Post(
        ownerName: 'Owner 9',
        liked: true,
        note: Note(
          saved: true,
          text: 'Note 9',
          postId: 9,
          id: 9,
        ),
        id: 9,
      ),
      const Post(
        ownerName: 'Owner 10',
        liked: false,
        note: Note(
          saved: false,
          text: 'Note 10',
          postId: 10,
          id: 10,
        ),
        id: 10,
      ),
    ];

    Set<Post> postSet = allPosts.value;

    for (Post post in dumList) {
      postSet.removeWhere((element) => element.id == post.id);
      postSet.add(post);
    }

    allPosts.add(postSet);

    return dumList;
  }

  // like / unlike post
  void likePost(int postId, bool liked, String ownerName, Note note) {
    Set<Post> postSet = allPosts.value;
    postSet.removeWhere((element) => element.id == postId);
    postSet.add(Post(
      id: postId,
      liked: !liked,
      ownerName: ownerName,
      note: note,
    ));
    allPosts.add(postSet);
  }
}