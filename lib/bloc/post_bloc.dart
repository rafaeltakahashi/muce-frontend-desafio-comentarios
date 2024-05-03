// Bloc for displaying the information of one post, along with its comments
// and reactions.

import 'dart:math';

import 'package:comentarios/domain/comment.dart';
import 'package:comentarios/domain/mock.dart';
import 'package:comentarios/domain/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//-------//
// STATE //
//-------//

abstract class PostBlocState {
  const PostBlocState();
}

class PostBlocStateLoaded extends PostBlocState {
  const PostBlocStateLoaded({
    required this.post,
  });
  final Post post;
}

//--------//
// EVENTS //
//--------//

abstract class PostBlocEvent {
  const PostBlocEvent();
}

class PostBlocEventNewComment extends PostBlocEvent {
  PostBlocEventNewComment(
      {required this.parentId, required this.comment, required this.locale});

  final String parentId;
  final String comment;
  final String locale;
}

class PostBlocEventNewReaction extends PostBlocEvent {
  PostBlocEventNewReaction(
      {required this.parentId, required this.reactionKind}); // One emoji.

  final String parentId;
  final String reactionKind;
}

//------//
// BLOC //
//------//

class PostBloc extends Bloc<PostBlocEvent, PostBlocState> {
  PostBloc() : super(PostBlocStateLoaded(post: mockPost)) {
    on<PostBlocEventNewComment>((event, emit) {
      // For a new comment, clone the entire post, comment by comment, and check
      // if any of the objects has the appropriate id. If it does, it gains a
      // new comment at the end of the list.
      var currentState = state;
      if (currentState is PostBlocStateLoaded) {
        // Now traverse this comment tree and mutate the comment whose id matches.
        var transformed = _recursiveTransform(currentState.post, (e) {
          if (e.id == event.parentId) {
            return e.copyWith(
                comments: e.comments.followedBy([
              Comment(
                id: Random().nextDouble().toString(),
                text: event.comment,
                date: DateTime.now(),
                locale: "",
                writer: userRafael,
                comments: [],
              )
            ]).toList());
          } else {
            return e;
          }
        });

        // In this case, we know the transformed item is a post because it was
        // a post before it was transformed.
        emit(PostBlocStateLoaded(post: transformed as Post));
      }
    });

    on<PostBlocEventNewReaction>((event, emit) {
      // For a new reaction, clone the entire post, comment by comment, and check
      // if any of the objects has the appropriate id. If it does, add the reaction
      // to its map of reactions.
      //
      // This is pretty much the same logic as the comment event and could
      // potentially be extracted to a different method.
      var currentState = state;
      if (currentState is PostBlocStateLoaded) {
        // Now traverse this comment tree and mutate the comment whose id matches.
        var transformed = _recursiveTransform(currentState.post, (e) {
          if (e.id == event.parentId) {
            return e.copyWith(
              reactions: e.reactions
                ..addAll({
                  userRafael: Reaction(
                    date: DateTime.now(),
                    kind: ["❤️", "🤔", "👍", "🔥", "⭐️"][Random().nextInt(5)],
                  ),
                }),
            );
          } else {
            return e;
          }
        });

        // In this case, we know the transformed item is a post because it was
        // a post before it was transformed.
        emit(PostBlocStateLoaded(post: transformed as Post));
      }
    });
  }
}

/// Transforms every element in the tree of comments according to a function.
/// Children are traversed based on the results.
Comment _recursiveTransform(Comment root, Comment Function(Comment) f) {
  // First, recursively transform each child.
  var subComments = root.comments.map((c) => _recursiveTransform(c, f));
  // Then, replace the root's children with the transformed ones and apply the
  // transforming function on the root itself.
  return f(root.copyWith(comments: subComments.toList()));
}
