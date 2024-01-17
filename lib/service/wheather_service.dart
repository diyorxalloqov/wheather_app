import 'dart:math';

import 'package:dio/dio.dart';
import 'package:wheather_news_app/core/constants/api/api.dart';
import 'package:wheather_news_app/model/hd_forecast_model.dart';
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

  Future<dynamic> getHDForecast(double longitude, double latitude) async {
    List<String> keys = [
      "4a8eaf9ed512f638cdd7a82434895402",
      "139d82d53b7f20c0a44c1bc27377f9ff",
      "4a8eaf9ed512f638cdd7a82434895402"
    ];
    int random = Random().nextInt(2);
    // '41.2646','69.2163'

    String url =
        "https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&units=metric&exclude=minutely,current&appid=${keys[random].toString()}";
    try {
      Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        return HdForecastNew.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      return e.message.toString();
    }
  }
}
