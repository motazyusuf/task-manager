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
  late List<Movie> movies;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoaded) {
            movies = state.movies;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: movies.isEmpty
                      ? const SizedBox()
                      : ListView.builder(
                          controller: context.read<NewsBloc>().scrollController,
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            if (index == movies.length - 1 &&
                                context.read<NewsBloc>().loading) {
                              return const Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }
                            return ArticleView(movie: movies[index]);
                          }),
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
