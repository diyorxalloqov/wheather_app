// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 0;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      uuid: fields[0] as String?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      keywords: fields[3] as String?,
      snippet: fields[4] as String?,
      url: fields[5] as String?,
      imageUrl: fields[6] as String?,
      language: fields[7] as String?,
      publishedAt: fields[8] as String?,
      source: fields[9] as String?,
      categories: (fields[10] as List?)?.cast<String>(),
      relevanceScore: fields[11] as dynamic,
      locale: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.keywords)
      ..writeByte(4)
      ..write(obj.snippet)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.imageUrl)
      ..writeByte(7)
      ..write(obj.language)
      ..writeByte(8)
      ..write(obj.publishedAt)
      ..writeByte(9)
      ..write(obj.source)
      ..writeByte(10)
      ..write(obj.categories)
      ..writeByte(11)
      ..write(obj.relevanceScore)
      ..writeByte(12)
      ..write(obj.locale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
