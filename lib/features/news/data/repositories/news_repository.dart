import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_manager/core/constants/constants.dart';
import 'package:task_manager/core/failure/failure.dart';
import 'package:task_manager/features/news/data/models/news_model.dart';

class NewsRepository {
  Future<Either<Failure, List<Movie>>> getNews(int page) async {
    try {
      Response response = await Dio().get(MyConstants.baseURL,
          queryParameters: {
            'page': page,
            'language': 'en-US',
          },
          options: Options(
            headers: {
              'Authorization': MyConstants.apiKey,
              'accept': 'application/json'
            },
          ));

      if (response.statusCode == 200) {
        return Right((response.data['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList());
      } else {
        return const Right([]);
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        return const Right([]);
      }

      return Left(Failure(errorMessage: e.message!));
    }
  }
}
