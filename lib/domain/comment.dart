import 'package:comentarios/domain/user.dart';

/// A comment made by a user on a resource that admits comments.
///
/// Each comment has a parent, but that's not a field in this class because
/// instead, each resource has a list of comments in it. Having both could
/// potentially cause loops.
///
/// A resource that admits comments has an ordered list of comments, sorted by
/// oldest first and newest last.
class Comment implements Commentable, Reactionable {
  const Comment({
    required this.id,
    required this.text,
    required this.writer,
    required this.locale,
    required this.date,
    this.comments = const [],
    this.reactions = const {},
  });
  @override
  final String id;
  final String text;
  final UserReference writer;
  final String locale; // ex.: pt_BR, zh_Hant
  final DateTime date;
  @override
  final List<Comment> comments;
  @override
  final Map<UserReference, Reaction> reactions;

  Comment clone() {
    return Comment(
      id: id,
      text: text,
      writer: writer,
      locale: locale,
      date: date.copyWith(),
      comments: comments.map((Comment c) => c.clone()).toList(),
      reactions: Map.from(reactions),
    );
  }

  Comment copyWith({
    String? id,
    String? text,
    UserReference? writer,
    String? locale,
    DateTime? date,
    List<Comment>? comments,
    Map<UserReference, Reaction>? reactions,
  }) {
    return Comment(
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

/// Like a comment, a reaction is attached on a resource that admits reactions.
/// Those resources have collections of reactions, and the reactions themselves
/// do not have references to the parent.
///
/// Unlike comments, reactions are unique by user. A user may not post more than
/// one reaction to a resource. Adding a reaction replaces any other reaction by
/// the same user.
class Reaction {
  const Reaction({
    required this.kind,
    required this.date,
  });
  final String kind; // One emoji. Examples: '😆', '💔', '😡'.
  final DateTime date;

  // This class doesn't need a reference to the user who reacted because that
  // information is used as the key of maps in resources that admit reactions.
}

/// Interface for resources that may have comments.
///
/// Any class that admits comments needs an id and a list of comments, and also
/// needs to provide a method for cloning itself.
abstract class Commentable {
  abstract final String id;
  abstract final List<Comment> comments;

  Commentable clone();
}

/// Interface for resources that can may have reactions.
///
/// Any class that admits reactions needs an id and a map of users to reactions,
/// and also needs to provide a method for cloning itself.
abstract class Reactionable {
  abstract final String id;
  abstract final Map<UserReference, Reaction> reactions;

  Reactionable clone();
}
