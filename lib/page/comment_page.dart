import 'package:comentarios/organism/post_detailed_view.dart';
import 'package:comentarios/template/simple_template.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleTemplate(
      title: "Comments",
      child: PostDetailedView(),
    );
  }
}
