import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

/// Text widget that supports markdown.
class MdText extends StatelessWidget {
  const MdText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      selectable: true,
      // Replacing line breaks is strictly speaking not correct in markdown.
      // We do this for convenience in this sample app, but you can choose to
      // adhere more closely to the markdown format.
      data: text.replaceAll('\n', "  \n"),
      onSelectionChanged: (_, __, ___) {}, // apparently crashes without this
    );
  }
}
