import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/features/news/data/models/news_model.dart';
import 'package:task_manager/features/news/presentation/manager/news_bloc.dart';
import 'package:task_manager/features/news/presentation/widgets/article_view.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Articles articles;

  @override
  void initState() {
    context.read<NewsBloc>().add(LoadNews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(LoadNews());

    return Scaffold(
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoaded) {
            articles = state.articles;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: articles.articles.isEmpty
                      ? const SizedBox()
                      : ListView.builder(
                          itemCount: articles.articles.length,
                          itemBuilder: (context, index) =>
                              ArticleView(article: articles.articles[index])),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
