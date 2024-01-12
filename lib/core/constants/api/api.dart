import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  static final String wheatherKey = dotenv.get("wheather_key");

  static const String getNews =
      "https://api.thenewsapi.com/v1/news/top?api_token=7BlO563C1MgA4QfTVFbeK9ltNLjspW1VXSQJsrpY&locale=us&limit=3";
  static final String getWheather =
      'https://api.openweathermap.org/data/2.5/weather?q=Tashkent&appid=$wheatherKey&units=metric';
}
