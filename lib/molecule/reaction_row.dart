import 'package:comentarios/atom/reaction_atom.dart';
import 'package:comentarios/domain/comment.dart';
import 'package:comentarios/domain/user.dart';
import 'package:flutter/material.dart';

// A row of reaction atoms. Each reaction atom will correspond to a reaction
// kind.
class ReactionRow extends StatelessWidget {
  const ReactionRow({super.key, required this.reactionMap});

  final Map<UserReference, Reaction> reactionMap;

  @override
  Widget build(BuildContext context) {
    // First, count the number of each reaction.
    // This means we'll convert the map from UserReference->Reaction to
    // String->amount.

    Map<String, int> amounts = {};
    reactionMap.forEach((userRef, reaction) {
      // Increment the count for the reaction in the new map.
      if (amounts.containsKey(reaction.kind)) {
        amounts[reaction.kind] = amounts[reaction.kind]! + 1;
      } else {
        amounts[reaction.kind] = 1;
      }
    });

    // Now, render all reactions in a row that wraps.
    return Wrap(
      children: amounts.entries
          .map((entry) => ReactionAtom(
                reactionKind: entry.key,
                amount: entry.value,
              ))
          .toList(),
    );
  }
}
