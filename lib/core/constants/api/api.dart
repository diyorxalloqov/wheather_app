import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  static final String newsKey = dotenv.get("news_key");
  static final String wheatherKey = dotenv.get("wheather_key");

  static final String getNews =
      'https://newsapi.org/v2/everything?q=tesla&from=2023-12-11&sortBy=publishedAt&apiKey=$newsKey';
  static final String getWheather =
      'https://api.openweathermap.org/data/2.5/weather?q=Tashkent&appid=$wheatherKey&units=metric';
}
