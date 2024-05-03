import 'package:comentarios/domain/comment.dart';
import 'package:comentarios/domain/user.dart';

/// In this sample app, a post is basically just a comment that doesn't have a
/// parent. Since parents aren't included in the class, a Post effectively
/// implements the Comment class without additional work.
class Post implements Commentable, Reactionable, Comment {
  const Post({
    required this.id,
    required this.writer,
    required this.text,
    required this.locale,
    required this.date,
    this.comments = const [],
    this.reactions = const {},
  });

  @override
  final String id;
  @override
  final UserReference writer;
  @override
  final String text;
  @override
  final String locale;
  @override
  final DateTime date;
  @override
  final List<Comment> comments;
  @override
  final Map<UserReference, Reaction> reactions;

  @override
  Post clone() {
    return Post(
      id: id,
      writer: writer,
      text: text,
      locale: locale,
      date: date.copyWith(),
      comments: comments.map((Comment c) => c.clone()).toList(),
      reactions: Map.from(reactions),
    );
  }

  @override
  Post copyWith({
    String? id,
    String? text,
    UserReference? writer,
    String? locale,
    DateTime? date,
    List<Comment>? comments,
    Map<UserReference, Reaction>? reactions,
  }) {
    return Post(
      id: id ?? this.id,
      text: text ?? this.text,
      writer: writer ?? this.writer,
      locale: locale ?? this.locale,
      date: date ?? this.date,
      comments: comments ?? this.comments,
      reactions: reactions ?? this.reactions,
    );
  }
}
