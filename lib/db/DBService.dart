import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wheather_news_app/model/wheather_model.dart';
import 'package:wheather_news_app/model/news_model.dart';
import 'package:wheather_news_app/service/news_service.dart';
import 'package:wheather_news_app/service/wheather_service.dart';

class DBService {
  Box<WheaterModel>? wheatherbox;
  Box<Data>? newsbox;
  NewsService newsService = NewsService();
  WheatherService wheatherService = WheatherService();

  Future<dynamic> checkNews() async {
    try {
      await openbox();
      if (newsbox!.isNotEmpty) {
        return newsbox!.values.toList();
      } else {
        return getNews();
      }
    } on HiveError catch (e) {
      print(e.message);
    }
  }

  Future<dynamic> getNews() async {
    Either<String, List<Data>> response = await newsService.getNews();
    response.fold((l) {
      return left(l);
    }, (data) async {
      await openbox();
      await writeToNews(data);
      return newsbox?.values.toList();
    });
  }

  static void registerAdapters() {
    Hive.registerAdapter(DataAdapter());
    Hive.registerAdapter(WheaterModelAdapter());
    Hive.registerAdapter(CoordAdapter());
    Hive.registerAdapter(WeatherAdapter());
    Hive.registerAdapter(MainAdapter());
    Hive.registerAdapter(WindAdapter());
    Hive.registerAdapter(CloudsAdapter());
    Hive.registerAdapter(SysAdapter());
  }

  Future<void> openbox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    newsbox = await Hive.openBox<Data>("news");
  }

  Future<void> writeToNews(List<Data> news) async {
    try {
      await openbox();
      await newsbox!.addAll(news);
    } on HiveError catch (e) {
      print(e.message);
    }
  }

  ////// Wheather

  // Future<dynamic> checkWheather() async {
  //   try {
  //     await openboxWheather();
  //     if (wheatherbox != null && wheatherbox!.isNotEmpty) {
  //       WheaterModel? data = wheatherbox!.get("data");
  //       return data;
  //     } else {
  //       print('salom');
  //       return getWheather();
  //     }
  //   } on HiveError catch (e) {
  //     print(e.message);
  //     return null;
  //   }
  // }

  Future<dynamic> getWheather() async {
    try {
      await openboxWheather();
      if (wheatherbox!.isNotEmpty) {
        WheaterModel? data = wheatherbox!.get("data");
        return data;
      } else {
        var response = await wheatherService.getWheathers();
        if (response is WheaterModel) {
          await writeToWheather(response);
          print(wheatherbox?.get('data'));
          return response;
        } else {
          print("Error");
          return response;
        }
      }
    } on HiveError catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<void> openboxWheather() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    wheatherbox = await Hive.openBox<WheaterModel>("wheather");
  }

  Future<void> writeToWheather(WheaterModel data) async {
    try {
      await openboxWheather();
      print('writing');
      await wheatherbox!.put("data", data);
      print(wheatherbox?.length);
    } on HiveError catch (e) {
      print(e.message);
    }
  }

  Future<void>refreshNews()async{
    
  }
}
