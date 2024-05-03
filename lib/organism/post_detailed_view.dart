// A detailed view for a post, with cards for the post itself and for all its
// comments. Everything can be replied to.
// This organism connects to the post bloc to get the currently selected post.

import 'package:flutter/material.dart';

import 'package:comentarios/bloc/post_bloc.dart';
import 'package:comentarios/molecule/comment_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailedView extends StatelessWidget {
  const PostDetailedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostBlocState>(
      builder: (context, state) {
        if (state is PostBlocStateLoaded) {
          return CommentCard(
            comment: state.post,
            onNewReaction: (id, reactionKind) {
              BlocProvider.of<PostBloc>(context).add(
                PostBlocEventNewReaction(
                  parentId: id,
                  reactionKind: reactionKind,
                ),
              );
            },
            onReplyWritten: (id, replyText) {
              BlocProvider.of<PostBloc>(context).add(
                PostBlocEventNewComment(
                  parentId: id,
                  comment: replyText,
                  locale: '',
                ),
              );
            },
          );
        } else {
          return const Text("Impossible to render.");
        }
      },
    );
  }
}
