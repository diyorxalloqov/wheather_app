import 'dart:convert';

HdForecastNew hdForecastNewFromJson(String str) =>
    HdForecastNew.fromJson(json.decode(str));

class HdForecastNew {
  HdForecastNew({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.hourly,
    required this.daily,
  });

  num lat;
  num lon;
  String timezone;
  List<Hourly> hourly;
  List<Daily> daily;

  factory HdForecastNew.fromJson(Map<String, dynamic> json) => HdForecastNew(
        lat: json["lat"] ?? 0.toDouble(),
        lon: json["lon"] ?? 0.toDouble(),
        timezone: json["timezone"] ?? "no data",
        hourly:
            List<Hourly>.from(json["hourly"].map((x) => Hourly.fromJson(x))),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );
}

class Daily {
  Daily({
    required this.dt,
    required this.temp,
    required this.weather,
  });

  num dt;
  Temp temp;
  Weather weather;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"] ?? 0,
        temp: Temp.fromJson(json["temp"]),
        weather: Weather.fromJson(json["weather"][0]),
      );
}

class Temp {
  Temp({required this.temp});

  num temp;

  factory Temp.fromJson(Map<String, dynamic> json) {
    num day = json["day"] ?? 0.toDouble();
    num min = json["min"] ?? 0.toDouble();
    num max = json["max"] ?? 0.toDouble();
    num night = json["night"] ?? 0.toDouble();
    num eve = json["eve"] ?? 0.toDouble();
    num morn = json["morn"] ?? 0.toDouble();

    num temp = (day + min + max + night + eve + morn) / 6;
    return Temp(temp: temp);
  }
}

class Weather {
  Weather({
    required this.main,
    required this.description,
    required this.icon,
  });

  Main? main;
  Description? description;
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        main: mainValues.map?[json["main"]],
        description: descriptionValues.map?[json["description"]],
        icon: json["icon"],
      );
}

enum Description {
  MODERATE_RAIN,
  LIGHT_RAIN,
  BROKEN_CLOUDS,
  CLEAR_SKY,
  OVERCAST_CLOUDS,
  FEW_CLOUDS,
  SCATTERED_CLOUDS
}

final descriptionValues = EnumValues({
  "broken clouds": Description.BROKEN_CLOUDS,
  "clear sky": Description.CLEAR_SKY,
  "few clouds": Description.FEW_CLOUDS,
  "light rain": Description.LIGHT_RAIN,
  "moderate rain": Description.MODERATE_RAIN,
  "overcast clouds": Description.OVERCAST_CLOUDS,
  "scattered clouds": Description.SCATTERED_CLOUDS
});

enum Main { RAIN, CLOUDS, CLEAR }

final mainValues =
    EnumValues({"Clear": Main.CLEAR, "Clouds": Main.CLOUDS, "Rain": Main.RAIN});

class Hourly {
  Hourly({
    required this.dt,
    required this.temp,
    required this.weather,
  });

  num dt;
  num temp;
  Weather weather;

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        dt: json["dt"] ?? 0,
        temp: json["temp"] ?? 0,
        weather: Weather.fromJson(json["weather"][0]),
      );
}

class Rain {
  Rain({
    required this.the1H,
  });

  num the1H;

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "1h": the1H,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
