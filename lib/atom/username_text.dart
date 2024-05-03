import 'package:flutter/material.dart';

/// Renders a username with a certain color and an at-sign (@) before it.
class UsernameText extends StatelessWidget {
  const UsernameText({
    super.key,
    required this.username,
    required this.color,
  });

  final String username;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      "@$username",
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w900,
        fontSize: 16,
      ),
    );
  }
}
