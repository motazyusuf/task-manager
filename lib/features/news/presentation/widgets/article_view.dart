import 'package:flutter/material.dart';

import '../../data/models/news_model.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Text(
      article.title,
      style: TextStyle(color: Colors.black),
    );
  }
}
