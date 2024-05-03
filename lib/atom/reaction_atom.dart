import 'package:flutter/material.dart';

class ReactionAtom extends StatelessWidget {
  const ReactionAtom({
    super.key,
    required this.reactionKind,
    required this.amount,
    this.onSelected, // TODO: NOT IMPLEMENTED
  });

  final String reactionKind;
  final int amount;
  final Function(String reactionKind)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
      label: Text('$reactionKind $amount'),
      padding: const EdgeInsets.all(0),
    );
  }
}
