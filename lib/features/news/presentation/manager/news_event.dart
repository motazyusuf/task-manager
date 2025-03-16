part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

class GetNewsEvent extends NewsEvent {}

class LoadMoreEvent extends NewsEvent {}
