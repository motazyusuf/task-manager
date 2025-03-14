import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/features/news/data/models/news_model.dart';

import '../../data/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository = NewsRepository();
  final ScrollController scrollController = ScrollController();
  int page = 1;

  NewsBloc() : super(NewsInitial()) {
    scrollController.addListener(() {
      add(LoadMoreEvent());
    });

    Future<void> onGetNews(event, emit) async {
      var response = await newsRepository.getNews(page);
      response.fold((ifLeft) {
        debugPrint(ifLeft.errorMessage);
        emit(NewsFailed(ifLeft.errorMessage));
      }, (ifRight) {
        emit(NewsLoaded(ifRight));
      });
    }

    Future<void> onLoadMore(event, emit) async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page++;
        print("I am here current page is $page");
        var response = await newsRepository.getNews(page);
        response.fold((ifLeft) {
          debugPrint(ifLeft.errorMessage);
          emit(NewsFailed(ifLeft.errorMessage));
        }, (ifRight) {
          if (state is NewsLoaded) {
            final currentState = state as NewsLoaded;
            emit(NewsLoaded([...currentState.movies, ...ifRight]));
          }
        });
      }
    }

    on<GetNewsEvent>(onGetNews);
    on<LoadMoreEvent>(onLoadMore);
  }
}
