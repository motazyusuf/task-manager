import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/core/configs/theme/text_theme.dart';
import 'package:task_manager/features/news/data/models/news_model.dart';
import 'package:task_manager/features/news/presentation/manager/news_bloc.dart';
import 'package:task_manager/features/news/presentation/widgets/article_view.dart';

import '../../../../core/configs/theme/app_colors.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late List<Article> articles;

  @override
  void initState() {
    context.read<NewsBloc>().add(LoadNews());
    super.initState();
  }

  final int itemsPerPage = 4; // Number of items per page
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoaded) {
            articles = state.articles.articles;
            int pageArticlesStart = currentPage * itemsPerPage;
            int pageArticlesEnd =
                (pageArticlesStart + itemsPerPage).clamp(0, articles.length);
            List<Article> pageArticles =
                articles.sublist(pageArticlesStart, pageArticlesEnd);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: articles.isEmpty
                      ? const SizedBox()
                      : ListView.builder(
                          itemCount: pageArticles.length,
                          itemBuilder: (context, index) =>
                              ArticleView(article: pageArticles[index])),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: currentPage > 0
                            ? () => setState(() => currentPage--)
                            : null,
                        icon: const Icon(Icons.chevron_left,
                            color: MyColors.onBackgroundIcon)),
                    Text(
                      "${currentPage + 1} / ${articles.length ~/ itemsPerPage + 1} ",
                      style: MyTextStyle.onBackgroundBold24,
                    ),
                    IconButton(
                      onPressed: pageArticlesEnd < articles.length
                          ? () => setState(() => currentPage++)
                          : null,
                      icon: const Icon(
                        Icons.chevron_right,
                        color: MyColors.onBackgroundIcon,
                      ),
                    )
                  ],
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
