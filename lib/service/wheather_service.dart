import 'package:dio/dio.dart';
import 'package:wheather_news_app/core/constants/api/api.dart';
import 'package:wheather_news_app/model/wheather_model.dart';

class WheatherService {
  Future<dynamic> getWheathers() async {
    try {
      Response response = await Dio().get(Api.getWheather);
      if (response.statusCode == 200) {
        print(response.data);
        return WheaterModel.fromJson(response.data);
      } else {
        return response.statusMessage?.toString() ?? "Unknown error";
      }
    } on DioException catch (e) {
      print(e.message);
      return "Connection error";
    }
  }
}
