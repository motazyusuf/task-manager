part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoaded extends NewsState {
  final List<Movie> movies;

  NewsLoaded(this.movies);
}

final class NewsFailed extends NewsState {
  final String message;

  NewsFailed(this.message);
}

final class NewsLoading extends NewsState {}
