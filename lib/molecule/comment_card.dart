import 'package:comentarios/atom/md_text.dart';
import 'package:comentarios/atom/username_text.dart';
import 'package:comentarios/domain/comment.dart';
import 'package:comentarios/molecule/reaction_row.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

/// Widget that renders one comment with its text, author and reactions.
/// It also recursively renders other nested comments, so it's only necessary
/// to render one instance of this class with the top comment or post.
class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
    required this.comment,
    this.level = 0,
    required this.onReplyWritten,
    required this.onNewReaction,
  });

  final Comment comment;
  final Function(String targetId, String replyText) onReplyWritten;
  final Function(String targetId, String reactionKind) onNewReaction;

  /// Levels add indentation to a card. Levels are mainly intended to be
  /// specified by other instances of CommentCard and not directly used.
  final int level;

  /// Renders a single card. Each call to the widget is meant to call this once,
  /// and the logic outside of this function is for recursively calling the
  /// widget again with a child comment.
  Widget _buildCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10 + 22.0 * level, 5, 10, 5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top row: Username and date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UsernameText(
                  username: comment.writer.username,
                  color: comment.writer.usernameColor ??
                      Theme.of(context).colorScheme.onBackground,
                ),
                Container(width: 10), // <- spacer
                Flexible(
                  child: Text(timeago.format(comment.date, locale: 'pt-BR')),
                ),
              ],
            ),
            // Middle row: Comment text only
            MdText(text: comment.text),
            // Bottom row: Reactions by people, react button and reply button
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                // Leftmost: reactions, expanded to occupy
                // all available remaining space
                Expanded(
                    child: ReactionRow(
                  reactionMap: comment.reactions,
                )),
                // Middle: reaction button
                IconButton(
                  onPressed: () {
                    onNewReaction(comment.id, "👍");
                  },
                  icon: const Icon(Icons.emoji_emotions_outlined),
                  color: Theme.of(context).colorScheme.primary,
                ),
                // Rightmost: Reply button
                ElevatedButton.icon(
                  onPressed: () {
                    onReplyWritten(comment.id, "New comment.");
                  },
                  icon: const Icon(Icons.reply),
                  label: const Text("Reply"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build a column where the topmost element is this comment, and all this
    // comment's children are rendered under it with one more level of
    // indentation.
    //
    // This is actually not the way I would recommend rendering a tree of
    // comments, unless you carefully prune them. This recursive logic doesn't
    // work with smart lists that carefully render and unrender elements.
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [_buildCard(context)] +
          comment.comments
              .map(
                (subComment) => CommentCard(
                  comment: subComment,
                  onNewReaction: onNewReaction,
                  onReplyWritten: onReplyWritten,
                  level: level + 1,
                ),
              )
              .toList(),
    );
  }
}
