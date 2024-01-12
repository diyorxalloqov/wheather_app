// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wheather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WheaterModelAdapter extends TypeAdapter<WheaterModel> {
  @override
  final int typeId = 0;

  @override
  WheaterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WheaterModel(
      coord: fields[0] as Coord?,
      weather: (fields[1] as List?)?.cast<Weather>(),
      base: fields[2] as String?,
      main: fields[3] as Main?,
      visibility: fields[4] as int?,
      wind: fields[5] as Wind?,
      rain: fields[6] as Rain?,
      clouds: fields[7] as Clouds?,
      dt: fields[8] as int?,
      sys: fields[9] as Sys?,
      timezone: fields[10] as int?,
      id: fields[11] as int?,
      name: fields[12] as String?,
      cod: fields[13] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, WheaterModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.coord)
      ..writeByte(1)
      ..write(obj.weather)
      ..writeByte(2)
      ..write(obj.base)
      ..writeByte(3)
      ..write(obj.main)
      ..writeByte(4)
      ..write(obj.visibility)
      ..writeByte(5)
      ..write(obj.wind)
      ..writeByte(6)
      ..write(obj.rain)
      ..writeByte(7)
      ..write(obj.clouds)
      ..writeByte(8)
      ..write(obj.dt)
      ..writeByte(9)
      ..write(obj.sys)
      ..writeByte(10)
      ..write(obj.timezone)
      ..writeByte(11)
      ..write(obj.id)
      ..writeByte(12)
      ..write(obj.name)
      ..writeByte(13)
      ..write(obj.cod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WheaterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CoordAdapter extends TypeAdapter<Coord> {
  @override
  final int typeId = 1;

  @override
  Coord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coord(
      lon: fields[0] as double?,
      lat: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Coord obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lon)
      ..writeByte(1)
      ..write(obj.lat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 2;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather(
      id: fields[0] as int?,
      main: fields[1] as String?,
      description: fields[2] as String?,
      icon: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.main)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MainAdapter extends TypeAdapter<Main> {
  @override
  final int typeId = 3;

  @override
  Main read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Main(
      temp: fields[0] as double?,
      feelsLike: fields[1] as double?,
      tempMin: fields[2] as double?,
      tempMax: fields[3] as double?,
      pressure: fields[4] as int?,
      humidity: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Main obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.temp)
      ..writeByte(1)
      ..write(obj.feelsLike)
      ..writeByte(2)
      ..write(obj.tempMin)
      ..writeByte(3)
      ..write(obj.tempMax)
      ..writeByte(4)
      ..write(obj.pressure)
      ..writeByte(5)
      ..write(obj.humidity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WindAdapter extends TypeAdapter<Wind> {
  @override
  final int typeId = 4;

  @override
  Wind read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wind(
      speed: fields[0] as double?,
      deg: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Wind obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.speed)
      ..writeByte(1)
      ..write(obj.deg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WindAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RainAdapter extends TypeAdapter<Rain> {
  @override
  final int typeId = 5;

  @override
  Rain read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rain(
      d1h: fields[0] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Rain obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.d1h);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CloudsAdapter extends TypeAdapter<Clouds> {
  @override
  final int typeId = 6;

  @override
  Clouds read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Clouds(
      all: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Clouds obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.all);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CloudsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SysAdapter extends TypeAdapter<Sys> {
  @override
  final int typeId = 7;

  @override
  Sys read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sys(
      type: fields[0] as int?,
      id: fields[1] as int?,
      country: fields[2] as String?,
      sunrise: fields[3] as int?,
      sunset: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Sys obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.sunrise)
      ..writeByte(4)
      ..write(obj.sunset);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SysAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
