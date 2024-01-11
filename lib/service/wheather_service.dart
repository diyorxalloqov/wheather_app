import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wheather_news_app/core/constants/api/api.dart';
import 'package:wheather_news_app/model/wheather_model.dart';

class WheatherService {
  Future<Either<String, WheaterModel>> getWheathers() async {
    try {
      Response response = await Dio().get(Api.getWheather);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        return right(WheaterModel.fromJson(response.data));
      } else {
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      print(e.message);
      return left(e.message.toString());
    }
  }
}
