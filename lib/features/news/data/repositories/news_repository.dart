import 'package:dio/dio.dart';

class NewsRepository {
  final dio = Dio();

  void request() async {
    Response response;
    response = await dio.get(
      'https://newsapi.org/v2/top-headlines',
      queryParameters: {
        'apiKey': '895cfa022c0c4ddfb96dc6f94696a914',
        'country': 'us'
      },
    );
    print(response.data.toString());
  }
}
