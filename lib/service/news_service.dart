import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wheather_news_app/core/constants/api/api.dart';
import 'package:wheather_news_app/model/news_model.dart';

class NewsService {
  Future<Either<String, List<Articles>>> getNews() async {
    try {
      Response response = await Dio().get(Api.getNews);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data['articles']);
        return right((response.data['articles'] as List)
            .map((e) => Articles.fromJson(e))
            .toList());
      } else {
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      print(e.message);
      return left(e.message.toString());
    }
  }
}
