part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoaded extends NewsState {
  final Articles articles;

  NewsLoaded(this.articles);
}

final class NewsFailed extends NewsState {
  final String message;

  NewsFailed(this.message);
}



