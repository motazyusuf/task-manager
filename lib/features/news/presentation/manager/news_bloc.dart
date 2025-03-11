import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_manager/features/news/data/models/news_model.dart';

import '../../data/repositories/news_repository.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository = NewsRepository();

  NewsBloc() : super(NewsInitial()) {
    Future<void> onLoadNews(event, emit) async {
      var response = await newsRepository.getNews();
      response.fold((ifLeft) {
        emit(NewsFailed(ifLeft.errorMessage));
      }, (ifRight) {
        emit(NewsLoaded(ifRight));
      });
    }

    on<LoadNews>(onLoadNews);
  }
}
