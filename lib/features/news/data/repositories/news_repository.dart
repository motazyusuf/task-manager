import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_manager/core/constants/constants.dart';
import 'package:task_manager/core/failure/failure.dart';
import 'package:task_manager/features/news/data/models/news_model.dart';

class NewsRepository {
  final _dio = Dio();

  Future<Either<Failure, Articles>> getNews() async {
    try {
      Response response = await _dio.get(
        MyConstants.baseURL,
        queryParameters: {
          'apiKey': MyConstants.apiKey,
          'country': MyConstants.q
        },
      );

      return Right(Articles.fromJson(response.data["articles"]));
    } on DioException catch (e) {
      return Left(Failure(errorMessage: e.message!));
    }
  }
}
