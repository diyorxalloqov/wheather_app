import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wheather_news_app/core/constants/api/api.dart';
import 'package:wheather_news_app/model/news_model.dart';

class NewsService {
  Future<Either<String, List<Data>>> getNews() async {
    try {
      Response response = await Dio().get(Api.getNews);
      if (response.statusCode == 200) {
        return right((response.data['data'] as List)
            .map((e) => Data.fromJson(e))
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
