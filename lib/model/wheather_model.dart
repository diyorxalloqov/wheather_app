import 'package:hive/hive.dart';

part 'wheather_model.g.dart';

@HiveType(typeId: 0)
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
  int? visibility;
  @HiveField(5)
  Wind? wind;
  @HiveField(6)
  Rain? rain;
  @HiveField(7)
  Clouds? clouds;
  @HiveField(8)
  int? dt;
  @HiveField(9)
  Sys? sys;
  @HiveField(10)
  int? timezone;
  @HiveField(11)
  int? id;
  @HiveField(12)
  String? name;
  @HiveField(13)
  int? cod;

  WheaterModel(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.rain,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  WheaterModel.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = base;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['dt'] = dt;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}

@HiveType(typeId: 1)
class Coord {
  @HiveField(0)
  double? lon;
  @HiveField(1)
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}

@HiveType(typeId: 2)
class Weather {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? main;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

@HiveType(typeId: 3)
class Main {
  @HiveField(0)
  double? temp;
  @HiveField(1)
  double? feelsLike;
  @HiveField(2)
  double? tempMin;
  @HiveField(3)
  double? tempMax;
  @HiveField(4)
  int? pressure;
  @HiveField(5)
  int? humidity;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    return data;
  }
}

@HiveType(typeId: 4)
class Wind {
  @HiveField(0)
  double? speed;
  @HiveField(1)
  int? deg;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    return data;
  }
}

@HiveType(typeId: 5)
class Rain {
  @HiveField(0)
  double? d1h;

  Rain({this.d1h});

  Rain.fromJson(Map<String, dynamic> json) {
    d1h = json['1h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1h'] = d1h;
    return data;
  }
}

@HiveType(typeId: 6)
class Clouds {
  @HiveField(0)
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

@HiveType(typeId: 7)
class Sys {
  @HiveField(0)
  int? type;
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? country;
  @HiveField(3)
  int? sunrise;
  @HiveField(4)
  int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
