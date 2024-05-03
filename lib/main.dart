import 'package:comentarios/bloc/post_bloc.dart';
import 'package:comentarios/page/comment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
  timeago.setLocaleMessages('pt-BR', timeago.PtBrMessages()); // setup
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: BlocProvider<PostBloc>(
        create: (_) => PostBloc(),
        child: const CommentPage(),
      ),
    );
  }
}
