import 'package:hive/hive.dart';

part 'wheather_model.g.dart';

@HiveType(typeId: 1)
class WheaterModel {
  @HiveField(0)
  Coord? coord;
  @HiveField(1)
  List<Weather>? weather;
  @HiveField(2)
  String? base;
  @HiveField(3)
  Main? main;
  @HiveField(4)
  num? visibility;
  @HiveField(5)
  Wind? wind;
  @HiveField(6)
  Clouds? clouds;
  @HiveField(7)
  num? dt;
  @HiveField(8)
  Sys? sys;
  @HiveField(9)
  num? timezone;
  @HiveField(10)
  num? id;
  @HiveField(11)
  String? name;
  @HiveField(12)
  num? cod;

  WheaterModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory WheaterModel.fromJson(Map<String, dynamic> json) {
    return WheaterModel(
      coord: Coord.fromJson(json['coord']),
      weather: (json['weather'] as List).map((e) => Weather.fromJson(e)).toList(),
      base: json['base'],
      main: Main.fromJson(json['main']),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'],
      sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}

@HiveType(typeId: 2)
class Coord {
  @HiveField(0)
  num? lon;
  @HiveField(1)
  num? lat;

  Coord({this.lon, this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'],
      lat: json['lat'],
    );
  }
}

@HiveType(typeId: 3)
class Weather {
  @HiveField(0)
  num? id;
  @HiveField(1)
  String? main;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

@HiveType(typeId: 4)
class Main {
  @HiveField(0)
  num? temp;
  @HiveField(1)
  num? feelsLike;
  @HiveField(2)
  num? tempMin;
  @HiveField(3)
  num? tempMax;
  @HiveField(4)
  num? pressure;
  @HiveField(5)
  num? humidity;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}

@HiveType(typeId: 5)
class Wind {
  @HiveField(0)
  num? speed;
  @HiveField(1)
  num? deg;

  Wind({this.speed, this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
      deg: json['deg'],
    );
  }
}

@HiveType(typeId: 6)
class Clouds {
  @HiveField(0)
  num? all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
    );
  }
}

@HiveType(typeId: 7)
class Sys {
  @HiveField(0)
  num? type;
  @HiveField(1)
  num? id;
  @HiveField(2)
  String? country;
  @HiveField(3)
  num? sunrise;
  @HiveField(4)
  num? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
