import 'package:protocarta/models/post.dart';
import 'package:rxdart/rxdart.dart';
import 'package:protocarta/models/note.dart';

class ListUpdateObject {
  ListUpdateObject({
    required this.id,
    required this.type,
  });

  final int id;
  final Type type;
}

class PostRepository {
  PostRepository();

  late final BehaviorSubject<Map<int, Post>> allPostsStream =
      BehaviorSubject<Map<int, Post>>.seeded({});
  late final BehaviorSubject<ListUpdateObject> listUpdateStream =
  BehaviorSubject<ListUpdateObject>.seeded(ListUpdateObject(id: -1, type: Null));

  Stream<Map<int, Post>> get getPostStream => allPostsStream.asBroadcastStream();
  Stream<ListUpdateObject> get getListUpdateStream => listUpdateStream.asBroadcastStream();

  // fetch pre-defined posts with Post model objects
  Future<List<Post>> fetchPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    List<Post> dumList = [
      const Post(
        ownerName: 'Owner AAA',
        liked: true,
        note: Note(
          saved: true,
          text: 'This is first note',
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
          text: 'This is second note',
          postId: 2,
          id: 2,
        ),
        id: 2,
      ),
      const Post(
        ownerName: 'Owner 3',
        liked: false,
        note: Note(
          saved: false,
          text: 'This is third note',
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
          text: 'This is fourth note',
          postId: 4,
          id: 4,
        ),
        id: 4,
      ),
      const Post(
        ownerName: 'Owner 5',
        liked: false,
        note: Note(
          saved: false,
          text: 'This is fifth note',
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
          text: 'This is sixth note',
          postId: 6,
          id: 6,
        ),
        id: 6,
      ),
      const Post(
        ownerName: 'Owner 7',
        liked: false,
        note: Note(
          saved: false,
          text: 'This is seventh note',
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
          text: 'This is eighth note',
          postId: 8,
          id: 8,
        ),
        id: 8,
      ),
      const Post(
        ownerName: 'Owner 9',
        liked: false,
        note: Note(
          saved: false,
          text: 'This is ninth note',
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
          text: 'This is tenth note',
          postId: 10,
          id: 10,
        ),
        id: 10,
      ),
    ];

    Map<int, Post> postSet = allPostsStream.value;
    postSet.addEntries(dumList.map((e) => MapEntry(e.id, e)));
    allPostsStream.add(postSet);

    return dumList;
  }

  // like / unlike post
  void likePost(Post post) {
    Map<int, Post> postSet = allPostsStream.value;
    postSet[post.id] = post.copyWith(liked: !post.liked);
    allPostsStream.add(postSet);
  }

  void updatePostsWithNotes(List<Note> noteList) {
    /// Get the Map<int, Content> from the list of content where the key is
    /// the id of the content.
    final Map<int, Note> noteMap = {for (var note in noteList) note.id: note};

    /// Get the list of curations from the stream.
    final outdatedPosts = allPostsStream.value;

    /// Create a new list of curations with the updated content.
    final updatedPosts = outdatedPosts.map((id, post) {
      /// The curation contains a content that exists in the contentList.
      /// The curation will be updated with the content.

      if (post.note?.id == null) {
        return MapEntry(post.id, post);
      }
      if (noteMap.containsKey(post.note!.id)) {
        return MapEntry(post.id, post.copyWith(note: noteMap[post.note!.id]));
      }

      return MapEntry(post.id, post);
    });
    //debugPrint('updatedPosts: $updatedPosts');
    updatePostStream(updatedPosts.values.toList());
  }

  void updatePostStream(List<Post> postList) {
    Map<int, Post> postSet = allPostsStream.value;
    for (Post post in postList) {
      postSet[post.id] = post;
    }
    allPostsStream.add(postSet);
  }

  void createPost(Post post) {
    Map<int, Post> postSet = Map.from(allPostsStream.value);
    postSet.addEntries([MapEntry(post.id, post)]);
    allPostsStream.add(postSet);
    listUpdateStream.add(ListUpdateObject(id: post.id, type: Post));
  }
}
