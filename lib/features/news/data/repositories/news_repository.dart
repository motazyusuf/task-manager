import 'package:dio/dio.dart';
import 'package:task_manager/core/constants/constants.dart';

class NewsRepository {
  final _dio = Dio();

  void request() async {
    Response response;
    response = await _dio.get(
      MyConstants.baseURL,
      queryParameters: {'apiKey': MyConstants.apiKey, 'country': MyConstants.q},
    );
    print(response.data.toString());
  }
}
