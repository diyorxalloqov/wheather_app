import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wheather_news_app/model/news_model.dart';
import 'package:wheather_news_app/model/wheather_model.dart';
import 'package:wheather_news_app/service/news_service.dart';

class DBService {
  Box<WheaterModel>? wheatherbox;
  Box<Data>? newsbox;
  NewsService newsService = NewsService();

  Future<dynamic> checkNews() async {
    await openbox();
    if (newsbox!.isNotEmpty) {
      return newsbox!.values.toList();
    } else {
      return getAlbum();
    }
  }

  Future<dynamic> getAlbum() async {
    dynamic response = await newsService.getNews();
    if (response is List<Data>) {
      await openbox();
      await writeToAlbum(response);
      return newsbox!.values.toList();
    } else {
      return response;
    }
  }

  static void registerAdapters() {
    Hive.registerAdapter(DataAdapter());
    Hive.registerAdapter(WheaterModelAdapter());
    Hive.registerAdapter(CoordAdapter());
    Hive.registerAdapter(WeatherAdapter());
    Hive.registerAdapter(MainAdapter());
    Hive.registerAdapter(WindAdapter());
    Hive.registerAdapter(RainAdapter());
    Hive.registerAdapter(CloudsAdapter());
    Hive.registerAdapter(SysAdapter());
  }

  Future<void> openbox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    newsbox = await Hive.openBox<Data>("news");
  }

  Future<void> writeToAlbum(List<Data> news) async {
    await openbox();
    await newsbox!.addAll(news);
  }
}
